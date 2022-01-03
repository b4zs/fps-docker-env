up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

configure-local:
	docker network create dev_proxy
	docker network create dev_database

deconfigure-local:
	docker network remove dev_proxy || true
	docker network remove dev_database || true
