TARGET=vpro-elasticsearch:dev
.PHONY: run

docker: Dockerfile elasticsearch.yml
	docker build -t $(TARGET) .
	touch $@

run: docker
	docker run -d --name elastic -p 9200:9200 vpro-elasticsearch:dev
	touch $@

clean:
	docker rm -f elastic
	rm run



