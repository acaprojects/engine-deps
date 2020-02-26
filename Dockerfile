FROM ruby:2.4-alpine3.6
MAINTAINER William Le (w.le@acaprojects.com)

RUN apk update && \
    apk add bash tzdata curl nano git openssl-dev openssh tcpdump   g++ make python  cmake perl libev-dev libuv-dev libxml2

RUN gem install sprockets -v 3.7.2 && gem install rails -v '~> 5.2.4.1' && gem install libcouchbase bundler

RUN sed -i 's/root::/root:!/g' /etc/shadow