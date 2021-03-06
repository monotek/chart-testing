FROM alpine:3.11


ARG HELM_VERSION=v3.2.4
ARG KUBECTL_VERSION=v1.18.6
ARG YAMALE_VERSION=2.0.1
ARG YAML_LINT_VERSION=1.21.0

COPY ./etc/chart_schema.yaml /etc/ct/chart_schema.yaml
COPY ./etc/lintconf.yaml /etc/ct/lintconf.yaml
COPY ./docker-install.sh /tmp/docker-install.sh
COPY ct /usr/local/bin/ct

RUN chmod +x /tmp/docker-install.sh && \
    /bin/sh -c /tmp/docker-install.sh && \
    rm /tmp/*
