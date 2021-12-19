const ci = require('miniprogram-ci');

/**
 * 获取环境参数
 * type 操作类型 preview | publish
 * version:版本号 上传操作必填
 * desc:版本描述  上传操作必填
 * appid:应用id,测试人员有时需要切换应用Id
 * buildId: 构建id
 */
const { type, version = '', desc = '', appid = '', buildId = '' } = getEnvParams(process.argv);

console.log(process.argv);

if (!appid) {
  console.error('appid不能为空!!!');
  process.exit(1);
}
// 微信小程序的私有key文件存储路径,每次新增appid时,需要找运维加私有key
const privateKeyPath = `/var/lib/jenkins/cert/private.${appid}.key`;

// 请求参数
const reqParams = {
  appid,
  type: 'miniProgram',
  projectPath: './',
  privateKeyPath,
  ignores: ['node_modules/**/*', 'yarn.lock', '.*'],
};
// 上传文件处理设置参数
const uploadParams = {
  es6: true, //  "es6 转 es5"
  es7: true, // "增强编译"
  minify: true, // "样式自动补全"
  codeProtect: true, // "代码保护"
  autoPrefixWXSS: true, // "样式自动补全"
};

const project = new ci.Project({ ...reqParams });

// 任何时候都生成二维码
(async () => {
  const previewResult = await ci.preview({
    project,
    desc: '预览', // 此备注将显示在“小程序助手”开发版列表中
    setting: uploadParams,
    qrcodeFormat: 'image',
    qrcodeOutputDest: `./qrcode-${buildId}.jpg`,
    onProgressUpdate: console.log,
    // pagePath: 'pages/index/index', // 预览页面
    // searchQuery: 'a=1&b=2',  // 预览参数 [注意!]这里的`&`字符在命令行中应写成转义字符`\&`
  });
  console.log(previewResult);
})();

if (type == 'publish') {
  (async () => {
    const uploadResult = await ci.upload({
      project,
      version,
      desc,
      setting: uploadParams,
      onProgressUpdate: console.log,
    });
    console.log(uploadResult);
  })();
}

/**
 * 获取node命令行参数
 * @param {array} options 命令行数组
 */
function getEnvParams(options) {
  let envParams = {};
  // 从第三个参数开始,是自定义参数
  for (let i = 2, len = options.length; i < len; i++) {
    let arg = options[i].split('=');
    envParams[arg[0]] = arg[1];
  }
  return envParams;
}
