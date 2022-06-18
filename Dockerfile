# syntax=docker/dockerfile:1
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y build-essential && \
  apt install -y software-properties-common && \
  apt install -y curl git man unzip vim wget sudo python&& \
  apt install -y \
    net-tools \
    libqt5dbus5 \
    libqt5core5a \
    libqt5sql5 \
    libqt5sql5-sqlite \
    libqt5webchannel5 \
    libqt5webengine5 \
    libqt5webenginecore5 \
    libqt5webenginewidgets5 \
    libqt5webkit5 \
    libqt5webview5 \
    libqt5widgets5 \
    libnss3-tools \
    # libpcap \
    libpcap-dev \
    ca-certificates


COPY . /client
RUN make /client
CMD python /client/app.py
