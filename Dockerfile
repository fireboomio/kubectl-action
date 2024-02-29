FROM alpine:3.19
LABEL MAINTAINER="erguotou <erguotou525@gmail.com>"

ARG KUBE_VERSION="v1.29.2"

COPY entrypoint.sh /entrypoint.sh
COPY kubectl /usr/local/bin/kubectl
RUN chmod +x /entrypoint.sh && \
    apk add --no-cache --update openssl curl ca-certificates && \
    # curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    curl -L https://kube.fireboom.io/kubectl/v1.29.2/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]