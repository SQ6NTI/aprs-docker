FROM alpine:latest AS build

RUN apk add --no-cache \
    git \
    build-base \
    cmake \
    alsa-lib-dev \
    libudev-zero-dev \
    avahi-dev \
    libgpiod-dev

WORKDIR /src
RUN git clone --depth=1 https://github.com/wb2osz/direwolf.git
WORKDIR /src/direwolf

RUN mkdir -p build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make -j"$(nproc)" && \
    make install

FROM alpine:latest

RUN apk add --no-cache \
    alsa-lib \
    libudev-zero \
    avahi-libs \
    tzdata \
    libgpiod \
    ca-certificates

RUN adduser -S direwolf

COPY --from=build /usr/local /usr/local

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER direwolf
WORKDIR /var/lib/direwolf

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["direwolf", "-t", "0"]
