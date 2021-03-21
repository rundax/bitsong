FROM golang:alpine AS build-env

# Set up dependencies
ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev python3 curl wget zip

## Install minimum necessary dependencies, build Cosmos SDK, remove packages
RUN apk add --no-cache $PACKAGES

ARG TAG
ENV DOWNLOAD_URL=https://github.com/bitsongofficial/go-bitsong/archive/refs/tags/v${TAG}.zip

# Add source files
RUN  cd /tmp && \
  echo "DOWNLOADING: $DOWNLOAD_URL" && \
  wget -nv $DOWNLOAD_URL -O bitsong-src.zip && \
  unzip bitsong-src.zip && \
  rm -f bitsong-src.zip && \
  mv /tmp/go-bitsong-${TAG}/ /src

WORKDIR /src

RUN make build



# Final image
FROM alpine:latest

# Install ca-certificates
RUN apk add --update ca-certificates
WORKDIR /root

# Copy over binaries from the build-env
COPY --from=build-env /src/build/bitsongd /usr/bin/bitsongd
COPY --from=build-env /src/build/bitsongcli /usr/bin/bitsongcli

RUN apk add --no-cache shadow
RUN apk add bash

###
### Envs
###
ENV MY_USER="bitsong" \
    MY_GROUP="bitsong" \
    MY_UID="1000" \
    MY_GID="1000"

####
#### User/Group
####
RUN set -eux \
    && addgroup -g ${MY_GID} ${MY_GROUP} \
    && adduser -u ${MY_UID} -G ${MY_GROUP} -s /bin/sh -D ${MY_USER}



COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./docker-entrypoint.d /docker-entrypoint.d

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

USER 1000

CMD ["bitsongd", "start"]