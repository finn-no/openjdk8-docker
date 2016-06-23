FROM alpine:edge

USER root

RUN mkdir /app
ENV JAVA_APP_DIR /app
ENV JAVA_VERSION 8.92.14-r0


RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add --update \
    curl \
    openjdk8-jre-base=$JAVA_VERSION \
 && rm /var/cache/apk/*

# Add run script as /app/run-java.sh and make it executable
COPY run-java.sh /app/run-java.sh
RUN chmod 755 /app/run-java.sh



CMD [ "/app/run-java.sh" ]
