FROM alpine:latest

RUN apk add --no-cache \
    build-base \
    libusb-dev \
    git \
    cmake

WORKDIR /src
RUN git clone https://github.com/osmocom/rtl-sdr.git
WORKDIR /src/rtl-sdr

RUN mkdir build && cd build && \
    cmake .. -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && \
    make -j$(nproc) && \
    make install

RUN apk del build-base git cmake

ENTRYPOINT ["rtl_tcp"]
CMD ["-a", "0.0.0.0", "-p", "1234"]
