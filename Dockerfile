FROM centos:centos7

ARG ANSIBLE_VERSION=2.9.10
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}

RUN yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 \
      python-keyczar python-paramiko python-setuptools \
      git python-pip ansible-${ANSIBLE_VERSION}
    
RUN yum clean all && rm -rf /var/cache/yum

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

CMD ['ansible']
