if test -f /run/host-services/ssh-auth.sock; then
  sudo chown cs300-user:cs300-user /run/host-services/ssh-auth.sock
fi
. ~/.bashrc