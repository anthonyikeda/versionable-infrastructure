#! /bin/bash
cat /tmp/server_rsa.pub >> /var/jenkins_home/.ssh/authorized_keys
/usr/sbin/sshd -D
