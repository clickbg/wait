tag := latest

all: build-container

build-container:
	docker build -t wait:${tag} .

push:
	docker buildx build --push --platform linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/amd64,linux/i386 --tag clickbg/wait:${tag} .

.PHONY: all push build-container
