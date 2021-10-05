#FROM opensearchproject/opensearch:latest
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.7.0

ENV DISTRO=elasticsearch

RUN bin/$DISTRO-plugin install analysis-icu
# TODO INSTALL KNN plugin how ?
#RUN bin/opensearch-plugin install https://artifacts.opensearch.org/releases/plugins/analysis-icu/1.0.0/analysis-icu-1.0.0.zip
#COPY opensearch.yml /usr/share/opensearch/config
COPY $DISTRO.yml /usr/share/$DISTRO/config

EXPOSE 9200
