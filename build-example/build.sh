#!/bin/sh
set -e



docker buildx build -t fps-php php/
#./docker-diff php:8.0.12-alpine fps-php

docker buildx build -t fps-node node/
#./docker-diff node:16-alpine fps-node

docker buildx build -t fps-nginx nginx/
#./docker-diff node:16-alpine fps-node

docker buildx build -t fps-all-on-one all-in-one/


#test -d app-code/html/.git || git clone https://gitlab.fps2.hu/web/gmalite-pottyos app-code/html
#docker buildx build -t app-code app-code/

#docker buildx build -t app-nginx app-nginx/
#docker buildx build -t app-php app-php/
