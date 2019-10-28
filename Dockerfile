#一个Dockerfile 实现构建多个镜像
FROM 100007533986/alpine-oraclejdk8:slim as oraclejdk8_base
FROM oraclejdk8_base AS eureka-service
ADD eurekaService/target/eurekaService-0.0.1-SNAPSHOT.jar /app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

FROM oraclejdk8_base AS tx-manager
ADD tx-manager/target/tx-manager-0.0.1-SNAPSHOT.jar /app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

FROM oraclejdk8_base AS bank-a
ADD bank-a/target/bank-a-0.0.1-SNAPSHOT.jar /app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


FROM oraclejdk8_base AS bank-b
ADD bank-b/target/bank-b-0.0.1-SNAPSHOT.jar /app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]