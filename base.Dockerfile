FROM alpine:3.19
LABEL MAINTAINER="erguotou <erguotou525@gmail.com>"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    apk add --no-cache --update openssl curl ca-certificates && \
    rm -rf /var/cache/apk/*