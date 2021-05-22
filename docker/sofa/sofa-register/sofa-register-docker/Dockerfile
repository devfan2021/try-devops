FROM adoptopenjdk/openjdk8:jdk8u262-b10-alpine

WORKDIR /tmp/build

RUN apk update && \
  apk upgrade && \
  apk add git maven curl

# RUN git clone https://github.com/sofastack/sofa-registry.git \
#     && cd sofa-registry \
#     && mvn clean package -DskipTests

# RUN cp server/distribution/integration/target/registry-integration.tgz ../sofa-registry-target \
#     && cd ../sofa-registry-target \
#     && mkdir registry-integration \
#     && tar -zxvf registry-integration.tgz -C registry-integration \
#     && cd registry-integration

RUN wget https://github.com/sofastack/sofa-registry/releases/download/v5.4.2/registry-integration-fix.tgz
RUN mkdir ../registry-integration && tar -zxvf registry-integration-fix.tgz -C ../registry-integration

RUN cd /tmp/registry-integration && ls

ENV APP_NAME="integration"
ENV BASE_DIR="/tmp/registry-integration"
ENV APP_JAR="${BASE_DIR}/registry-${APP_NAME}.jar"
RUN echo "APP_JAR is $APP_JAR"

# app conf
ENV JAVA_OPTS="$JAVA_OPTS -Dregistry.${APP_NAME}.home=${BASE_DIR}"
ENV JAVA_OPTS="$JAVA_OPTS -Dspring.config.location=${BASE_DIR}/conf/application.properties"

# set user.home
ENV JAVA_OPTS="$JAVA_OPTS -Duser.home=${BASE_DIR}"

# springboot conf
ENV SPRINGBOOT_OPTS="${SPRINGBOOT_OPTS} --logging.config=${BASE_DIR}/conf/logback-spring.xml"

# heap size
ENV HEAP_MAX=512
ENV HEAP_NEW=256
ENV JAVA_OPTS="$JAVA_OPTS -server -Xms${HEAP_MAX}m -Xmx${HEAP_MAX}m -Xmn${HEAP_NEW}m -Xss256k"

# gc option
RUN mkdir -p "${BASE_DIR}/logs"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:${BASE_DIR}/logs/registry-${APP_NAME}-gc.log -verbose:gc"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${BASE_DIR}/logs -XX:ErrorFile=${BASE_DIR}/logs/registry-${APP_NAME}-hs_err_pid%p.log"
ENV JAVA_OPTS="$JAVA_OPTS -XX:-OmitStackTraceInFastThrow -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=4"
ENV JAVA_OPTS="$JAVA_OPTS -XX:+CMSClassUnloadingEnabled -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70"

# rm raftData
RUN rm -rf ${BASE_DIR}/raftData/

# start
RUN echo "Command: java ${JAVA_OPTS} -jar ${APP_JAR} ${SPRINGBOOT_OPTS}"
RUN java ${JAVA_OPTS} -jar ${APP_JAR} ${SPRINGBOOT_OPTS} >> "$STD_OUT" 2>&1 &

EXPOSE 9615 9622 9603 9600

ENTRYPOINT [ "sh", "-c", "exec java ${JAVA_OPTS} -jar ${APP_JAR} ${SPRINGBOOT_OPTS}" ]