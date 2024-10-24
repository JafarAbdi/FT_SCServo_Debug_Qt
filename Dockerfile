# Copied from https://github.com/facontidavide/PlotJuggler/blob/main/Dockerfile
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install \
    libqt5serialport5 \
    libqt5serialport5-dev \
    file \
    wget \
    g++ \
    cmake \
    git

RUN mkdir -p /opt/ft_scservo
COPY . /opt/ft_scservo
RUN mkdir /opt/ft_scservo/build

WORKDIR /opt/ft_scservo/build

RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr && \
    make -j `nproc` && \
    make install DESTDIR=AppDir && \
    /opt/ft_scservo/AppImage.sh

FROM scratch AS exporter
COPY --from=builder /opt/ft_scservo/build/FT_SCServo-x86_64.AppImage /

