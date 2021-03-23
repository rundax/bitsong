init:
	cp .env.dist .env

build:
	docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

logs:
	docker-compose logs -f

