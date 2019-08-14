AW_VERSION := v0.7.1

help: ## Show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## build docker image
	docker build \
		-t thaim/aw-server \
		-t thaim/aw-server:${AW_VERSION} \
		.

push: ## push docker image to DockerHub
	docker push thaim/activity-watch
	docker push thaim/activity-watch:${AW_VERSION}
