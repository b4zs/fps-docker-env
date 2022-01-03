#PHP_VERSION=v${PHP_VERSION}

IMAGE_NAME=fps-web-php:php${PHP_VERSION}-node${NODE_VERSION}

build:
	make build-php8 PHP_VERSION=8.0 NODE_VERSION=12

build7:
	make build-php8 PHP_VERSION=7.4 NODE_VERSION=12

build-php8:
	@[ "${PHP_VERSION}" ] || ( echo ">> PHP_VERSION is not set"; exit 1 )
	@[ "${NODE_VERSION}" ] || ( echo ">> NODE_VERSION is not set"; exit 1 )

	docker buildx build \
		--build-arg PHP_VERSION=${PHP_VERSION} \
		--build-arg NODE_VERSION=${NODE_VERSION} \
		-t ${IMAGE_NAME} \
		./

	docker images ${IMAGE_NAME}

sh:
	docker run -it --rm ${IMAGE_NAME} sh

demo:
	cd demo && docker-compose up

