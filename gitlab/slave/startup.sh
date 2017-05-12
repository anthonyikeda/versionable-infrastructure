#! /bin/bash
cat /tmp/server_rsa.pub | ssh USER@HOST "cat >> /var/jenkins_home/.ssh/authorized_keys"
/usr/sbin/sshd -D
