#!/bin/bash

PWD=`pwd`
GITHUB=${GITHUB_USER:-flagrant}
REPO=${REPO:-docker-mux-go}
APP_NAME=${APP_NAME:-myapp}
USERNAME=${USERNAME:-moli}
DOCKER_APP=${DOCKER_APP:-mux-go}

# since we are using godep, we need to call godep to save our things in the vendor directory for
# the following build step to succeed
godep save

# we pass in the volume to ensure the go builder understands that it *is* a properly formatted go
# path structure
# we pass in the workspace to ensure things work properly
# this should also take advantage of the vendor sources
docker run --rm -v ${PWD}:/go/src/github.com/${GITHUB}/${REPO} -w /go/src/github.com/${GITHUB}/${REPO} iron/go:dev go build -o ${APP_NAME}

# build this and name it after our docker information
docker build -t ${USERNAME}/${DOCKER_APP} .
