FROM opensearchproject/opensearch:latest

#RUN bin/opensearch-plugin install analysis-icu
RUN bin/opensearch-plugin install https://artifacts.opensearch.org/releases/plugins/analysis-icu/1.0.0/analysis-icu-1.0.0.zip
COPY opensearch.yml /usr/share/opensearch/config

EXPOSE 9200
