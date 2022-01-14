PHONY: build

build:
	docker build -t jakegough/chia-network-nonroot:1.2.11 .
	docker tag jakegough/chia-network-nonroot:1.2.11 jakegough/chia-network-nonroot:latest

push: build
	docker push jakegough/chia-network-nonroot:1.2.11
	docker push jakegough/chia-network-nonroot:latest
