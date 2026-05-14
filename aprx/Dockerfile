FROM alpine:latest

RUN apk add --no-cache aprx

COPY aprx.conf /etc/aprx.conf

ENTRYPOINT ["aprx"]
CMD ["-f", "/etc/aprx.conf"]
