FROM alpine:3.14
USER root
WORKDIR /app

RUN apk add --no-cache wireguard-tools socat

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 51820/udp
EXPOSE 1080/tcp
ENTRYPOINT ["/app/entrypoint.sh"]