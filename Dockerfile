#FROM opensearchproject/opensearch:latest
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.0

ENV DISTRO=elasticsearch

RUN bin/$DISTRO-plugin install analysis-icu && \
    bin/$DISTRO-plugin install --batch https://github.com/alexklibisz/elastiknn/releases/download/7.10.0.0/elastiknn-7.10.0.0.zip
# TODO INSTALL KNN plugin how ?
#RUN bin/opensearch-plugin install https://artifacts.opensearch.org/releases/plugins/analysis-icu/1.0.0/analysis-icu-1.0.0.zip
#COPY opensearch.yml /usr/share/opensearch/config


COPY $DISTRO.yml /usr/share/$DISTRO/config

EXPOSE 9200
