ARG DOCKER_SERVER_HOST
ARG DOCKER_SERVER_PORT
ARG DOCKER_PROJECT_PATH
ARG DOCKER_IMAGE_VERSION=master

FROM ${DOCKER_SERVER_HOST}:${DOCKER_SERVER_PORT}/${DOCKER_PROJECT_PATH}/base:${DOCKER_IMAGE_VERSION}

COPY ./docker-entrypoint.d/100-init.sh /docker-entrypoint.d/100-init.sh

STOPSIGNAL SIGINT
CMD ["bitsongd", "start"]
