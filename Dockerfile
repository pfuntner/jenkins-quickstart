FROM jenkins/jenkins:2.414.2-jdk17
USER root

# bsdextrautils provides the column command
RUN apt-get update && apt-get install -y lsb-release python3 python3-pip bsdextrautils
RUN ln -sv /usr/bin/python3 /usr/bin/python
RUN python -m pip install ansible --break-system-packages

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"