.PHONY: up down restart logs build clean wp-cli shell help

# Default target when running just 'make'
.DEFAULT_GOAL := help

## help: Show available commands
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  up         Start all Docker containers in detached mode"
	@echo "  down       Stop and remove all containers"
	@echo "  restart    Restart all containers"
	@echo "  logs       Tail container logs in real time"
	@echo "  clean      Stop containers and remove volumes (DESTRUCTIVE)"
	@echo "  shell      Access the WordPress container shell"
	@echo "  wp-cli     Access the WordPress CLI container shell"

## up: Start containers
up:
	docker compose up -d

## down: Stop containers
down:
	docker compose down

## restart: Restart containers
restart:
	docker compose restart

## logs: View logs
logs:
	docker compose logs -f

## clean: Stop and purge volumes
clean:
	docker compose down -v

## shell: Open an interactive shell inside the WordPress container
shell:
	docker compose exec wordpress sh

## wp-cli: Open an interactive WP-CLI shell session
wp-cli:
	docker compose run --rm --entrypoint sh wordpress-cli
