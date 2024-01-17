#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

export DEBIAN_FRONTEND=noninteractive

apt-get update &&\
  yes | unminimize

# install GCC-related packages
apt-get update && apt-get -y install\
			  binutils-doc\
			  cpp-doc\
			  gcc-doc\
			  g++\
			  g++-multilib\
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

# Do main setup
$SCRIPT_DIR/container-setup-common

# create binary reporting version of dockerfile
(echo '#\!/bin/sh'; echo 'echo 1') > /usr/bin/cs300-docker-version && chmod ugo+rx,u+w,go-w /usr/bin/cs300-docker-version

rm -f /root/.bash_logout
