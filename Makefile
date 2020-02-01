SHELL := /bin/bash

build:
	docker-compose \
	-f docker-compose.build.yaml \
	-f docker-compose.register.yaml \
	build

up:
	docker-compose \
	-f docker-compose.run.yaml \
	-f docker-compose.register.yaml \
	up

up-dev:
	docker-compose \
	-f docker-compose.run.yaml \
	-f docker-compose.run.dev.yaml \
	-f docker-compose.register.yaml \
	up

clone-core:
	git clone https://github.com/Project-Gen/project-gen.core core/code