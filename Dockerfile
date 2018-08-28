FROM openjdk:8u171-jdk-slim-stretch
MAINTAINER João Henrique

RUN apt-get update && \
    apt-get install -y  software-properties-common wget git gnupg2 nano python-pip


ARG STORM_VERSION
ARG ZOOKEEPER_PORT

RUN wget -q -O - http://www-eu.apache.org/dist/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz 
RUN tar -xzf apache-storm-${STORM_VERSION}.tgz -C /opt

WORKDIR /opt

RUN echo "export ZOOKEEPER_PORT=${ZOOKEEPER_PORT}" >> ~/.bashrc
