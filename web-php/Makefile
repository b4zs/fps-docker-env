#PHP_VERSION=v${PHP_VERSION}

IMAGE_NAME=fps-web-php

build:
	make build-php8 PHP_VERSION=8.0.7

build-php8:
	@[ "${PHP_VERSION}" ] || ( echo ">> PHP_VERSION is not set"; exit 1 )

	docker buildx build \
		--build-arg PHP_VERSION=${PHP_VERSION} \
		-t ${IMAGE_NAME} \
		./

	docker images ${IMAGE_NAME}

sh:
	docker run -it --rm ${IMAGE_NAME} sh

demo:
	cd demo && docker-compose up

