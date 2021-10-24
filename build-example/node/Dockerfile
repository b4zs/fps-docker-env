FROM node:16-alpine as build

RUN apk add make

RUN rm -rf \
    /tmp/* \
    /var/tmp/* \
    /var/cache/* \
    /lib/apk/db  \
    /usr/include

FROM node:16-alpine

COPY --from=build / /

RUN mkdir -p /var/www/html

WORKDIR /var/www/html
