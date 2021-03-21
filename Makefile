

build:
	docker build \
	-t test \
	--build-arg TAG=0.7.0-rc1 \
	docker/