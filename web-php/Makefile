#PHP_VERSION=v${PHP_VERSION}

NAMESPACE=b4zs
IMAGE_NAME=${NAMESPACE}/fps-web:php${PHP_VERSION}-node${NODE_VERSION}

build-and-push80:
	make build80
	make push80

build80:
	make build-image PHP_VERSION=8.0 NODE_VERSION=12

push80:
	make push PHP_VERSION=8.0 NODE_VERSION=12

build74:
	make build-image PHP_VERSION=7.4 NODE_VERSION=12

push74:
	make push PHP_VERSION=7.4 NODE_VERSION=12

build-image:
	@[ "${PHP_VERSION}" ] || ( echo ">> PHP_VERSION is not set"; exit 1 )
	@[ "${NODE_VERSION}" ] || ( echo ">> NODE_VERSION is not set"; exit 1 )

	docker buildx build \
		--build-arg PHP_VERSION=${PHP_VERSION} \
		--build-arg NODE_VERSION=${NODE_VERSION} \
		-t ${IMAGE_NAME} \
		./

	docker images ${IMAGE_NAME}

push:
	docker push ${IMAGE_NAME}

sh:
	docker run -it --rm ${IMAGE_NAME} sh


