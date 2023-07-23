# Use an official Python runtime as a parent image
FROM python:3.8-slim




FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -qq
RUN apt-get update && apt-get install -y \
        software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
        python3.10 \
        python3-pip
RUN apt-get update && apt-get install -y \
        python3.10-distutils \
        python3-setuptools
RUN python3.10 -m pip install pip

RUN python3.10 -m pip install --upgrade pip setuptools distlib


RUN apt-get update && apt-get install -y dirmngr wget python3.10-dev
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 10

# Set the working directory in the container to /app
WORKDIR ./
COPY hello.py ./hello.py

COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt --upgrade

# Set the command to be executed when launching a container from this image
CMD ["python", "hello.py"]


