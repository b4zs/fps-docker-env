# php base image

A megbeszéltek szerint debian alapú image-eket fogunk használni. 

- PHP version:
  - 7.4
  - 8.0
- purpose:
  - prod
    - extensions:
      - gd (freetype, libjpeg-turbo)
      - soap
      - exif
      - sockets
      - xml
      - soap
      - opcache
      - pdo
      - pdo_mysql
      - intl
      - curl
      - iconv 
      - pcntl 
      - openssl 
      - simplexml (php7)
    - wp-hez: 
      - tidy 
      - xmlrpc 
    - pecl
      - redis
      - memcached
      - ~~mongodb~~
    - config:
      - ami célszerű... 
      - memory limit legyen olyan, ami jó prod-ra
  - dev
    - extensions (prod+): 
      - xdebug 
    - config
      - opcache revalidate freq
      - xdebug config 

> @Laci megoldása: https://gitlab.srah.eu/docker/php/-/blob/main/fpm/scripts/startup/21-devmode-init.sh

Laci mintája alapján akár benne lehet a prod image-ben is az xdebug, csak kondicionálisan engedélyezzük fejlesztésnél. 
