#!/bin/sh

DOCKERHUB_USERNAME=$1

docker pull ${DOCKERHUB_USERNAME}/test-backend
docker pull ${DOCKERHUB_USERNAME}/test-frontend

docker container rm -f test-backend
docker container rm -f test-frontend

docker run -d --name test-backend --restart unless-stopped -p 8000:8000 ${DOCKERHUB_USERNAME}/test-backend
docker run -d --name test-frontend --restart unless-stopped -p 80:80 ${DOCKERHUB_USERNAME}/test-frontend
