FROM fireboomapi/kubectl-action-base
LABEL MAINTAINER="erguotou <erguotou525@gmail.com>"

ARG KUBE_VERSION="v1.29.2"

RUN curl -o /usr/local/bin/kubectl https://kube.fireboom.io/kubectl/v1.29.2/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]