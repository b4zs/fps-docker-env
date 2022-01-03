ARG PHP_VERSION
ARG NODE_VERSION

FROM php:${PHP_VERSION}-fpm-alpine as base


RUN  --mount=type=cache,target=/var/cache/apt\
    apk --update add git $PHPIZE_DEPS
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install exif


# gd + intl
RUN  --mount=type=cache,target=/var/cache/apt \
     apk add  \
      icu \
      icu-dev \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && docker-php-ext-install intl \
    && apk del --no-cache \
      icu-dev \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && rm -rf /tmp/*


RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN docker-php-source delete
RUN apk del $PHPIZE_DEPS

COPY --from=composer /usr/bin/composer /usr/bin/composer

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer / && rm /tmp/s6-overlay-amd64-installer

RUN rm -rf /usr/local/bin/phpdbg /var/cache/apk

RUN  --mount=type=cache,target=/var/cache/apt \
    apk --update --no-cache add \
    curl \
    nginx \
    tzdata \
    ncdu \
    && addgroup -S php \
    && adduser -S -G php php \
    && rm -rf /etc/nginx/conf.d/* /etc/php8/conf.d/* /etc/php8/php-fpm.d/*


FROM node:${NODE_VERSION}-alpine AS node

FROM php:${PHP_VERSION}-fpm-alpine

COPY --from=base / /

COPY files/nginx files/php8 /

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

WORKDIR /www
CMD ["/init"]
EXPOSE 80 443
#HEALTHCHECK --interval=60s --timeout=5s CMD curl -f http://127.0.0.1/ || exit 1
