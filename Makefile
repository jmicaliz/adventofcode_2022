
DOCKERBUILD = docker build -t
DOCKERRUN = docker run --rm -it -v "$(shell pwd)/src:/advent/src" --name
DOCKERPS = docker ps -q
DOCKERSTOP = docker stop

.DEFAULT_GOAL := help

all: help

.PHONY: help all

help: ## generate make help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-build: ## docker build
	$(DOCKERBUILD) kbase .

docker-run: ## docker run k
	$(DOCKERRUN) kbase kbase

docker-run-solutions: ## docker run solutions
	$(DOCKERRUN) kbase kbase "k /advent/solutions/solutions.k"

docker-run-enter: ## docker run bash
	$(DOCKERRUN) kbase kbase /bin/bash
