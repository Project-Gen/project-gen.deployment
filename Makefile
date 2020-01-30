SHELL := /bin/bash

build:
	docker-compose build

up:
	docker-compose up

bash:
	docker exec -it playground.app /bin/bash

container_id := $(shell docker container ps -q -f "name=playground.app")
rm:
	docker container rm $(container_id) -f
