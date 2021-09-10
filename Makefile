TARGET=vpro-elasticsearch:dev

.PHONY: docker run
docker:
	docker build -t $(TARGET) .


run:
	docker run -p 9200:9200 -it vpro-elasticsearch:dev
