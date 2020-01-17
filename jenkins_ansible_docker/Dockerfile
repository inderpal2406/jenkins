FROM jenkins/jenkins

MAINTAINER Inderpal Singh <inderpal2406@gmail.com>

ENV REFRESHED_AT=17-01-2020_11:00_UTC

USER root

# Install ansible
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade

# Install docker, we didn't use docker.sh from get.docker.com to install docker, as it needs systemctl utility afterwards to enable docker.
# We followed docker docs to install docker on debian host as jenkins/jenkins image is debian based
RUN apt-get update -y && \
    apt-get install -y \ 
        apt-transport-https \
        ca-certificates \
        gnupg2 \
	software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo $ID)/gpg > /tmp/dkey && \
    apt-key add /tmp/dkey && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo $ID) $(lsb_release -cs) stable" && \
    apt-get update -y && \
    apt-get install -y docker-ce

# Install compose
RUN curl -L https://github.com/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` \
        -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose 

RUN usermod -aG docker jenkins

USER jenkins
