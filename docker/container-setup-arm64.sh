#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

export DEBIAN_FRONTEND=noninteractive

apt-get update &&\
  yes | unminimize

# include multiarch support
apt-get -y install binfmt-support &&\
  dpkg --add-architecture amd64 &&\
  apt-get update &&\
  apt-get upgrade

# install GCC-related packages
apt-get -y install\
	binutils-doc\
	cpp-doc\
	gcc-doc\
	g++\
	gdb\
	gdb-doc\
	gdbserver\
	glibc-doc\
	libblas-dev\
	liblapack-dev\
	liblapack-doc\
	libstdc++-11-doc\
	make\
	make-doc

# install GCC-related packages for amd64
apt-get -y install\
	g++-11-x86-64-linux-gnu\
	gdb-multiarch\
	libc6:amd64\
	libstdc++6:amd64\
	libasan5:amd64\
	libtsan0:amd64\
	libubsan1:amd64\
	libreadline-dev:amd64\
	libblas-dev:amd64\
	liblapack-dev:amd64\
	qemu-user

# link x86-64 versions of common tools into /usr/x86_64-linux-gnu/bin
for i in addr2line c++filt cpp-11 g++-11 gcc-11 gcov-11 gcov-dump-11 gcov-tool-11 size strings; do \
    ln -s /usr/bin/x86_64-linux-gnu-$i /usr/x86_64-linux-gnu/bin/$i; done && \
    ln -s /usr/bin/x86_64-linux-gnu-cpp-11 /usr/x86_64-linux-gnu/bin/cpp && \
    ln -s /usr/bin/x86_64-linux-gnu-g++-11 /usr/x86_64-linux-gnu/bin/c++ && \
    ln -s /usr/bin/x86_64-linux-gnu-g++-11 /usr/x86_64-linux-gnu/bin/g++ && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-11 /usr/x86_64-linux-gnu/bin/gcc && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-11 /usr/x86_64-linux-gnu/bin/cc && \
    ln -s /usr/bin/gdb-multiarch /usr/x86_64-linux-gnu/bin/gdb

# Do main setup
$SCRIPT_DIR/container-setup-common

# create binary reporting version of dockerfile
(echo '#\!/bin/sh'; echo 'if test "x$1" = x-n; then echo 1; else echo 1.arm64; fi') > /usr/bin/cs300-docker-version && chmod ugo+rx,u+w,go-w /usr/bin/cs300-docker-version

rm -f /root/.bash_logout
