TARGET=npo-poms/opensearch:dev
.PHONY: 

docker: Dockerfile opensearch.yml
	docker build -t $(TARGET) .
	touch $@

run: docker
	docker run -d --name opensearch -p 9200:9200 --platform linux/amd64 $(TARGET)

runit: docker
	docker run -it --name opensearch -p 9200:9200 --platform linux/amd64 $(TARGET)


rungh:
	docker run -d --name opensearch  -p 9200:9200 --platform linux/amd64 ghcr.io/npo-poms/opensearch:opendistro

explore: docker
	docker run --entrypoint bash -it $(TARGET)


clean:
	-docker rm -f opensearch 
	-docker image rm -f $(TARGET) 	
	rm -f docker
