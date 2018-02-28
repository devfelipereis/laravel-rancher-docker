up:
	docker-compose up -d

down:
	docker-compose down

stop:
	docker-compose stop

sh:
	docker-compose exec application bash

sh\:db:
	docker-compose exec mariadb bash