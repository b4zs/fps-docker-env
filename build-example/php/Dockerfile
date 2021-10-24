FROM php:8.0-fpm-alpine as build

RUN apk --update add \
     git  \
     $PHPIZE_DEPS \
      icu-dev \
      libxml2-dev \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      curl-dev \
      libpng-dev

RUN docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
  && docker-php-ext-install gd

RUN docker-php-ext-install soap
RUN docker-php-ext-install exif
RUN docker-php-ext-install sockets
RUN docker-php-ext-install xml
RUN docker-php-ext-install soap
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install intl
RUN docker-php-ext-install curl
RUN docker-php-ext-install iconv
RUN docker-php-ext-install pcntl


RUN  pecl install redis \
    && echo extension=redis.so >> /usr/local/etc/php/conf.d/redis.ini

#RUN  pecl install mongodb \
#  && echo extension=mongodb.so >> /usr/local/etc/php/conf.d/mongo.ini




RUN apk del --no-cache \
              autoconf g++ make openssl-dev libxml2-dev \
              freetype-dev \
              libjpeg-turbo-dev \
              libpng-dev \
              $PHPIZE_DEPS

RUN apk add make

RUN rm -rf \
    /tmp/* \
    /var/tmp/* \
    /var/cache/* \
    /lib/apk/db  \
    /usr/local/lib/php/.registry \
    /usr/local/lib/php/PEAR \
    /usr/local/lib/php/build \
    /usr/include

ADD ./config/php-ini-overrides.ini /usr/local/etc/php/conf.d/99-overrides.ini

COPY --from=composer /usr/bin/composer /usr/bin/composer



FROM php:8.0.12-alpine

COPY --from=build / /

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
CMD php-fpm
