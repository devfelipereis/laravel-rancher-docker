PROJECT=`pwd | xargs basename`
TESTIMAGE=${PROJECT}:testing

up:
	docker-compose up --build

down:
	docker-compose down

stop:
	docker-compose stop

sh:
	docker-compose exec application bash

sh\:db:
	docker-compose exec database bash

setup:
	cp .env.example .env
	docker-compose up

key\:db:
	echo "Generating key..."
	docker-compose exec application php artisan key:generate && php artisan config:clear
	echo "Migrating and seeding..."
	docker-compose exec application php artisan migrate --seed

migrate:
	docker-compose exec application php artisan migrate

image\:test:
	docker build -f Dockerfile.prod -t ${TESTIMAGE} .
	GOSS_SLEEP=3 dgoss run -i ${TESTIMAGE}