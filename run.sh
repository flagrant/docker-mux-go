#!/bin/bash

USERNAME=${USERNAME:-moli}
DOCKER_APP=${DOCKER_APP:-mux-go}
APP_PORT=8080
EXPOSED_PORT=${EXPOSED_PORT:-8080}

# now that we have built the container, we can run it as we like
# make sure to expose the ports correctly, and use the proper docker naming
docker run --rm -p "${EXPOSED_PORT}:${APP_PORT}" ${USERNAME}/${DOCKER_APP}
