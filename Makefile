SHELL := /bin/bash

.PHONY: all install lint
all: install lint

.PHONY: install
install:
	terraform init
	git init
	pre-commit install
	git add -A

.PHONY: lint
lint:
	pre-commit run
