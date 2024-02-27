FROM ruby:2.7-alpine
MAINTAINER William Le (w.le@acaprojects.com)

# Disable root login and switch to newer repo for security updates
RUN sed -i 's/root::/root:!/g' /etc/shadow && \
    sed -i 's/3.16/3.19/g' /etc/apk/repositories

# Add python2 repo to alpine versions > 3.15
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/community"  >> /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add bash tzdata curl nano git openssl-dev tcpdump g++ make python2 cmake libev-dev libuv-dev libxml2 openssh perl build-base

# Use installed libuv package for libcouchbase gem
ENV USE_GLOBAL_LIBUV=true

RUN gem install sprockets -v 3.7.2 && \
    gem install nokogiri -v 1.15.5 && \
    gem install rails -v '~> 5.2.6.2' && \
    gem install libcouchbase && \
    gem install bundler -v 2.4.22
