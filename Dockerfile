FROM openjdk:8u171-jdk-slim-stretch
MAINTAINER João Henrique

RUN apt-get update && \
    apt-get install -y  software-properties-common wget git gnupg2 nano

ARG STORM_VERSION
ARG ZOOKEEPER_PORT

RUN wget http://www-us.apache.org/dist/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz
RUN tar -xzf apache-storm-${STORM_VERSION}.tar.gz -C /opt

# COPY . /opt
COPY supervisor/start.sh  /opt/supervisor/



# RUN echo "export ZOOKEEPER_PORT=${ZOOKEEPER_PORT}" >> ~/.bashrc
RUN chmod +x /opt/supervisor/start.sh

WORKDIR /opt
