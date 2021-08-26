TARGET=vpro-elasticsearch:dev

docker:
	docker build -t $(TARGET) .
