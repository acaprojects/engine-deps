FROM ruby:2.4-alpine3.6
MAINTAINER William Le (w.le@acaprojects.com)

RUN apk update && \
    apk add bash tzdata curl nano git openssh tcpdump   g++ make python  cmake perl libev-dev libuv-dev libxml2 && \
    cp /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
    echo "Australia/Sydney" >  /etc/timezone

RUN gem install libcouchbase bundler rails && \ 
    chmod -R 777 $BUNDLE_PATH
