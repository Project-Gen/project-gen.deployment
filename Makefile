SHELL := /bin/bash

APP_NAME := "project-gen"

build:
	docker-compose \
	-f docker-compose.build.yaml \
	-f docker-compose.register.yaml \
	build

up: build
	docker-compose \
	-f docker-compose.run.yaml \
	-f docker-compose.register.yaml \
	up

up-dev: build
	docker-compose \
	-f docker-compose.run.yaml \
	-f docker-compose.run.dev.yaml \
	-f docker-compose.register.yaml \
	up

up-test: build
	docker-compose \
	-f docker-compose.run.yaml \
	-f docker-compose.run.test.yaml \
	-f docker-compose.register.yaml \
	up

connect-core:
	docker exec -it $(APP_NAME).core bash

clone-core:
	git clone https://github.com/Project-Gen/project-gen.core core/code