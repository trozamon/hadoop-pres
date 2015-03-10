FROM centos:6.6

MAINTAINER Alec Ten Harmsel <alec@alectenharmsel.com>

RUN yum update -y
RUN yum install -y wget vim tmux
RUN wget -O /etc/yum.repos.d/cdh5.repo http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
RUN yum install -y git java-1.7.0-openjdk spark-core
RUN cd /root && git clone git://github.com/trozamon/hadoop-pres.git
