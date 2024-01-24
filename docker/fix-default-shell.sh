#!/bin/bash
# Set default shell to /bin/bash if it has the default of /bin/sh
# This is a workaround for podman-based container setups with
# --userns=keep-id, which assumes /bin/sh

USER=$(id -un)
if test "$(getent passwd $USER | awk -F: '{print $NF}')" = "/bin/sh"; then 
	echo "Setting default shell for future logins"
	sudo usermod -s /bin/bash $USER
fi
