include .env
export

init:
	cp .env.dist .env

.PHONY: build
build: ## build environment and initialize composer and project dependencies
#	docker build .docker/base/ \
#	--tag $(DOCKER_SERVER_HOST):$(DOCKER_SERVER_PORT)/$(DOCKER_PROJECT_PATH)/base:$(DOCKER_IMAGE_VERSION) \
#	--build-arg DOCKER_SERVER_HOST=$(DOCKER_SERVER_HOST) \
#	--build-arg DOCKER_SERVER_PORT=$(DOCKER_SERVER_PORT) \
#	--build-arg DOCKER_PROJECT_PATH=$(DOCKER_PROJECT_PATH) \
#	--build-arg DOCKER_IMAGE_VERSION=$(DOCKER_IMAGE_VERSION)\
#	--build-arg BITSONG_TAG=$(BITSONG_TAG)
#
#	docker build .docker/validator/ \
#	--tag $(DOCKER_SERVER_HOST):$(DOCKER_SERVER_PORT)/$(DOCKER_PROJECT_PATH)/validator:$(DOCKER_IMAGE_VERSION) \
#	--build-arg DOCKER_SERVER_HOST=$(DOCKER_SERVER_HOST) \
#	--build-arg DOCKER_SERVER_PORT=$(DOCKER_SERVER_PORT) \
#	--build-arg DOCKER_PROJECT_PATH=$(DOCKER_PROJECT_PATH) \
#	--build-arg DOCKER_IMAGE_VERSION=$(DOCKER_IMAGE_VERSION)
#
#	docker build .docker/rewards/ \
#	--tag $(DOCKER_SERVER_HOST):$(DOCKER_SERVER_PORT)/$(DOCKER_PROJECT_PATH)/rewards:$(DOCKER_IMAGE_VERSION) \
#	--build-arg DOCKER_SERVER_HOST=$(DOCKER_SERVER_HOST) \
#	--build-arg DOCKER_SERVER_PORT=$(DOCKER_SERVER_PORT) \
#	--build-arg DOCKER_PROJECT_PATH=$(DOCKER_PROJECT_PATH) \
#	--build-arg DOCKER_IMAGE_VERSION=$(DOCKER_IMAGE_VERSION)

	docker build .docker/monitoring/ \
	--tag $(DOCKER_SERVER_HOST):$(DOCKER_SERVER_PORT)/$(DOCKER_PROJECT_PATH)/monitoring:$(DOCKER_IMAGE_VERSION) \
	--build-arg DOCKER_SERVER_HOST=$(DOCKER_SERVER_HOST) \
	--build-arg DOCKER_SERVER_PORT=$(DOCKER_SERVER_PORT) \
	--build-arg DOCKER_PROJECT_PATH=$(DOCKER_PROJECT_PATH) \
	--build-arg DOCKER_IMAGE_VERSION=$(DOCKER_IMAGE_VERSION) \
	--build-arg MONITORING_TAG=$(MONITORING_TAG)


up:
	docker-compose up -d

stop:
	docker-compose stop

logs:
	docker-compose logs -f

