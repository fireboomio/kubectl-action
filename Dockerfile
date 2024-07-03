FROM alpine:3.19
LABEL MAINTAINER="erguotou <erguotou525@gmail.com>"

# ARG KUBE_VERSION="v1.29.2"

COPY entrypoint.sh /entrypoint.sh
COPY kubectl.tar.gz /kubectl.tar.gz

RUN tar -zxvf /kubectl.tar.gz -C /usr/local/bin/ && \
    chmod +x /entrypoint.sh && \
    chmod +x /usr/local/bin/kubectl
    # apk add --no-cache --update openssl curl ca-certificates && \
    # rm -rf /var/cache/apk/*
    # curl -o /usr/local/bin/kubectl https://kube.fireboom.io/kubectl/v1.29.2/linux/amd64/kubectl && \
    # chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]