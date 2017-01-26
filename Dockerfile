FROM alpine:edge

RUN apk add --update alpine-sdk \
    && apk add --update openjdk8-jre-base \
    && rm -rf /var/cache/apk/*

