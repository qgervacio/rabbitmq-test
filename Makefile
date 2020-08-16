# Copyright (c) 2020 Quirino Gervacio

.PHONY: help

help:
	@echo "Usage: make [target]"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-11s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

c: clean
clean: ## (c) Clean repo by resetting head hard
	@git clean -fdx
	@git fetch origin
	@git reset --hard origin/master
	
s: start
start: ## (s) Start RabbitMQ for testing
	@docker-compose down
	@docker-compose up
	
p: prepare
prepare: ## (p) Import data and enable delay plugin
	@docker-compose exec rabbitmq-a rabbitmqadmin -u admin -p admin import /tmp/data-a.json
	@docker-compose exec rabbitmq-b rabbitmqadmin -u admin -p admin import /tmp/data-b.json
	@docker-compose exec rabbitmq-b cp /tmp/plg/rabbitmq_delayed_message_exchange-3.8.0.ez /opt/rabbitmq/plugins/
	@docker-compose exec rabbitmq-b rabbitmq-plugins enable rabbitmq_delayed_message_exchange
	@docker-compose exec rabbitmq-b rabbitmq-plugins list
