FROM ruby:2.4-alpine3.11
MAINTAINER William Le (w.le@acaprojects.com)

RUN apk update && \
    apk add bash tzdata curl nano git openssl-dev openssh tcpdump   g++ make python  cmake perl libev-dev libuv-dev libxml2

RUN gem install libcouchbase bundler rails && \ 
    chmod -R 777 $BUNDLE_PATH
