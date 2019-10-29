#一个Dockerfile 实现构建多个镜像
#FROM 100007533986/alpine-oraclejdk8:slim
FROM ccr.ccs.tencentyun.com/moto/openjdk-tini-arthas-ttf:v22
LABEL version="1.0" description="springboot 微服务-a" by="wuyibo"
#MAINTAINER 维护者信息
MAINTAINER wuyibo  <771227828@qq.com>
ADD bank-a/target/bank-a-0.0.1-SNAPSHOT.jar /app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
