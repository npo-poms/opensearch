FROM adoptopenjdk/openjdk11:alpine-slim

ARG VERSION=7.14.1
ARG ZIP=elasticsearch-${VERSION}-linux-x86_64.tar.gz
ENV ES_JAVA_HOME=/opt/java/openjdk
RUN apk add --no-cache curl bash &&  \
   mkdir /elasticsearch && chown -R 405 /elasticsearch && \
   cd /elasticsearch && curl https://artifacts.elastic.co/downloads/elasticsearch/$ZIP | tar zxf - && \
   ln -s /elasticsearch/elasticsearch-$VERSION /elasticsearch/elasticsearch && \
   /elasticsearch/elasticsearch/bin/elasticsearch-plugin install analysis-icu && \
   chown -R 405  /elasticsearch/elasticsearch-$VERSION

COPY elasticsearch.yml /elasticsearch/elasticsearch/config/
USER 405

ENTRYPOINT /elasticsearch/elasticsearch/bin/elasticsearch


