FROM jruby:9-jdk-alpine
MAINTAINER William Le (w.le@acaprojects.com)

RUN apk update && \
    apk add bash tzdata curl nano git openssh tcpdump   g++ make python  cmake perl libev-dev libuv-dev libxml2 openssl-dev && \
    cp /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
    echo "Australia/Sydney" >  /etc/timezone

RUN gem install libcouchbase bundler rails && \ 
    chmod -R 777 $BUNDLE_PATH
