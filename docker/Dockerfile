FROM ubuntu:jammy

LABEL org.opencontainers.image.source=https://github.com/csci0300/cs300-s24-devenv

COPY container-setup-amd64.sh /usr/local/bin/container-setup-amd64
COPY container-setup-common.sh /usr/local/bin/container-setup-common

# set default locale
ENV LANG en_US.UTF-8

RUN /usr/local/bin/container-setup-amd64

# git build arguments
ARG USER=cs300\ User
ARG EMAIL=nobody@example.com

# configure your environment
USER cs300-user

WORKDIR /home/cs300-user
CMD ["/bin/bash", "-l"]
