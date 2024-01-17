#!/bin/bash

set -eu

# set up default locale
export LANG=en_US.UTF-8

# install clang-related packages
apt-get -y install\
 clang\
 clang-14-doc\
 lldb\
 clang-format

# install qemu for WeensyOS (sadly, this pulls in a lot of crap)
apt-get -y --no-install-recommends install\
 qemu-system-x86

# install programs used for system exploration
apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump

# install interactive programs (emacs, vim, nano, man, sudo, etc.)
apt-get -y install\
 bc\
 curl\
 dc\
 git\
 git-doc\
 man\
 micro\
 nano\
 psmisc\
 sudo\
 wget\
 file\
 xxd

# install rust
RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/rust \
  bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo -E sh -s -- -y"

# set up libraries
apt-get -y install\
 libreadline-dev\
 locales\
 wamerican\
 libssl-dev

# generate default locale
locale-gen en_US.UTF-8

# install programs used for networking
apt-get -y install\
 dnsutils\
 inetutils-ping\
 iproute2\
 net-tools\
 netcat\
 telnet\
 time\
 traceroute

# remove unneeded .deb files
rm -r /var/lib/apt/lists/*

# set up passwordless sudo for user cs300-user
useradd -m -s /bin/bash cs300-user && \
    echo "cs300-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs300-init
