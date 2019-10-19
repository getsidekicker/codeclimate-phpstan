.PHONY: image

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOCKERFILE := $(dir $(MKFILE_PATH))Dockerfile

IMAGE_NAME ?= codeclimate/codeclimate-phpstan

image:
	docker build --rm -t $(IMAGE_NAME) -f "$(DOCKERFILE)" . 
