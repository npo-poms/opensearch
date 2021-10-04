TARGET=vpro-opensearch:dev
.PHONY: run

docker: Dockerfile opensearch.yml
	docker build -t $(TARGET) .
	touch $@

run: docker
	docker run -d --name opensearch -p 9200:9200 vpro-opensearch:dev
	touch $@

clean:
	docker rm -f opensearch
	rm run



