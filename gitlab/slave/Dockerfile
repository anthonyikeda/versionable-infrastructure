FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y git curl ruby-build
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN echo "jenkins:jenkins" | chpasswd

RUN mkdir -p /var/jenkins_home/.ssh
RUN chown jenkins:jenkins /var/jenkins_home/.ssh

ADD keys/server_rsa.pub /tmp/server_rsa.pub
RUN chmod 400 /tmp/server_rsa.pub
ADD startup.sh /var/jenkins_home/startup.sh
RUN chmod g+x /var/jenkins_home/startup.sh
RUN chown jenkins:jenkins /var/jenkins_home/startup.sh

USER jenkins
RUN touch /var/jenkins_home/.ssh/known_hosts

EXPOSE 22

CMD ["/var/jenkins_home/startup.sh"]
