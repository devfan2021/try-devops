## get请求的抓包
tcpdump --nn -e -A -vvv 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' | grep "gw/wx/callback"
