
all: build up

build:
	docker compose -f ./srcs/docker-compose.yml build 

up:
	docker compose -f ./srcs/docker-compose.yml up -d

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	docker system prune -af

re: clean all

status:
	docker ps

.PHONY: all re clean