FROM fedora:27
MAINTAINER David Wagner <david.wagner@easymile.com>

RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf

RUN dnf install -y \
    git \
    gcc-c++ \
    cmake \
    make \
    gstreamer1-rtsp-server-devel \
    gstreamer1-plugins-good \
    boost-program-options \
    boost-devel \
    catch-devel

RUN adduser -Um user
USER user
WORKDIR /home/user

RUN git clone https://github.com/EasyMile/ez-rtsp-server.git
WORKDIR ez-rtsp-server
RUN git checkout fb0c6b3202d1c80f0a0f85cfa6aa72ea45ad6d9c

RUN mkdir ../build
WORKDIR ../build
RUN cmake ../ez-rtsp-server && make

ENTRYPOINT ["./SimpleRtspServer", "--port", "8554"]
EXPOSE 8554
