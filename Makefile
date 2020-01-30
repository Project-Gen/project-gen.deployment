SHELL := /bin/bash

build:
	docker build -t payground.app ./app

run:
	docker run -p 3200:80 -d --name palyground.app -v `pwd`/app/code:/app/www playground.app

bash:
	docker exec -it playgorund.app /bin/bash

app_container_id := $(shell docker container ps -q -f "name=playground.app")
rm:
	docker container rm $(app_container_id) -f

up:
	docker-compose up

