PHONY: build

CHIA_VERSION=1.2.11

build:
	docker build --build-arg CHIA_VERSION=$(CHIA_VERSION) -t jakegough/chia-network-nonroot:$(CHIA_VERSION) .
	docker tag jakegough/chia-network-nonroot:$(CHIA_VERSION) jakegough/chia-network-nonroot:latest

push: build
	docker push jakegough/chia-network-nonroot:$(CHIA_VERSION)
	docker push jakegough/chia-network-nonroot:latest
