
DOCKERBUILD = docker build -t
DOCKERRUN = docker run --rm -d --name
DOCKERPS = docker ps -q
DOCKERSTOP = docker stop

.DEFAULT_GOAL := help

all: help

.PHONY: help all

help: ## generate make help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-build: ## docker build
	$(DOCKERBUILD) kbase .

docker-run: ## docker run postgres container
	$(DOCKERRUN) kbase kbase

docker-run-enter: ## docker run postgres container
	docker run --rm -it --name kbase kbase /bin/bash
