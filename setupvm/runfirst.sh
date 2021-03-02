#!/bin/bash
echo "$LOGNAME ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
mkdir ~/.ssh
chmod 700 ~/.ssh
cat << EOF > ~/.ssh/config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF
chmod 600 ~/.ssh/config
