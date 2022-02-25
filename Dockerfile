FROM ruby:2.7-alpine
MAINTAINER William Le (w.le@acaprojects.com)

RUN apk update && \
    apk add bash tzdata curl nano git openssl-dev tcpdump   g++ make python  cmake libev-dev libuv-dev libxml2

# Disable root login and Switch to newer repo for openssh and perl, to resolve CVE-2018-15473 and CVE-2005-3962
RUN sed -i 's/root::/root:!/g' /etc/shadow && \
    sed -i 's/3.6/3.11/g' /etc/apk/repositories
RUN apk update && apk add openssh perl

RUN gem install sprockets -v 3.7.2 && gem install rails -v '~> 5.2.6.2' && gem install libcouchbase bundler
