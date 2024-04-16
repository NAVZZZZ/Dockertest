FROM ubuntu:latest
RUN apt update
RUN apt install git && awscli && zip &&& unzip && wget -y
WORKDIR /home
