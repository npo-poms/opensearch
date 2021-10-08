#FROM opensearchproject/opensearch:latest

#FROM amazon/opendistro-for-elasticsearch:1.8.0
# Results in 7.7.0

FROM amazon/opendistro-for-elasticsearch:1.13.2
# Results in 7.10.2

ENV DISTRO=elasticsearch

RUN bin/$DISTRO-plugin install analysis-icu

USER elasticsearch
COPY $DISTRO.yml /usr/share/$DISTRO/config

EXPOSE 9200

ENTRYPOINT "/usr/share/$DISTRO/bin/$DISTRO"
