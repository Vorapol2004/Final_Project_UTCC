.PHONY: help up down build logs clean restart shell-spring shell-next shell-mysql install-frontend install-backend dev test

# Default target
help:
	@echo "🚀 Final Project UTCC - Makefile Commands"
	@echo ""
	@echo "Docker Commands:"
	@echo "  make up              - Start all services (detached mode)"
	@echo "  make down            - Stop and remove all containers"
	@echo "  make build           - Build all Docker images"
	@echo "  make rebuild         - Rebuild all images (no cache)"
	@echo "  make logs            - Show logs from all services"
	@echo "  make logs-spring     - Show Spring Boot logs"
	@echo "  make logs-next       - Show Next.js logs"
	@echo "  make logs-mysql      - Show MySQL logs"
	@echo "  make restart         - Restart all services"
	@echo "  make restart-spring  - Restart Spring Boot only"
	@echo "  make restart-next    - Restart Next.js only"
	@echo "  make clean           - Stop, remove containers and volumes"
	@echo "  make ps              - Show running containers"
	@echo ""
	@echo "Development Commands:"
	@echo "  make dev             - Run in development mode (no Docker)"
	@echo "  make install-frontend - Install Next.js dependencies"
	@echo "  make install-backend  - Install Maven dependencies (download)"
	@echo ""
	@echo "Shell Access:"
	@echo "  make shell-spring    - Access Spring Boot container shell"
	@echo "  make shell-next      - Access Next.js container shell"
	@echo "  make shell-mysql     - Access MySQL container shell"
	@echo ""
	@echo "Database Commands:"
	@echo "  make db-backup      - Backup database"
	@echo "  make db-restore     - Restore database (requires FILE=backup.sql)"
	@echo ""
	@echo "Utility Commands:"
	@echo "  make status          - Show status of all services"
	@echo "  make env-example    - Create .env from env.example"

# Docker Compose Commands
up:
	@echo "🚀 Starting all services..."
	docker-compose up -d
	@echo "✅ Services started! Check with 'make logs' or 'make ps'"

down:
	@echo "🛑 Stopping all services..."
	docker-compose down
	@echo "✅ Services stopped"

build:
	@echo "🔨 Building Docker images..."
	docker-compose build
	@echo "✅ Build complete"

rebuild:
	@echo "🔨 Rebuilding Docker images (no cache)..."
	docker-compose build --no-cache
	@echo "✅ Rebuild complete"

up-build:
	@echo "🔨 Building and starting services..."
	docker-compose up -d --build
	@echo "✅ Services built and started!"

logs:
	@echo "📋 Showing logs (Ctrl+C to exit)..."
	docker-compose logs -f

logs-spring:
	@echo "📋 Showing Spring Boot logs..."
	docker-compose logs -f spring-boot

logs-next:
	@echo "📋 Showing Next.js logs..."
	docker-compose logs -f nextjs

logs-mysql:
	@echo "📋 Showing MySQL logs..."
	docker-compose logs -f mysql

restart:
	@echo "🔄 Restarting all services..."
	docker-compose restart
	@echo "✅ Services restarted"

restart-spring:
	@echo "🔄 Restarting Spring Boot..."
	docker-compose restart spring-boot
	@echo "✅ Spring Boot restarted"

restart-next:
	@echo "🔄 Restarting Next.js..."
	docker-compose restart nextjs
	@echo "✅ Next.js restarted"

clean:
	@echo "🧹 Cleaning up containers, volumes, and images..."
	docker-compose down -v
	@echo "⚠️  All containers and volumes removed!"

ps:
	@echo "📊 Container status:"
	docker-compose ps

status: ps
	@echo ""
	@echo "🌐 Service URLs:"
	@echo "  Frontend:  http://localhost:3000"
	@echo "  Backend:   http://localhost:8080"
	@echo "  MySQL:     localhost:3306"

# Shell Access
shell-spring:
	@echo "🐚 Accessing Spring Boot container..."
	docker-compose exec spring-boot sh

shell-next:
	@echo "🐚 Accessing Next.js container..."
	docker-compose exec nextjs sh

shell-mysql:
	@echo "🐚 Accessing MySQL container..."
	docker-compose exec mysql bash

# Development Commands (without Docker)
dev:
	@echo "💻 Development mode - Make sure MySQL is running!"
	@echo "Run these commands in separate terminals:"
	@echo "  1. Backend:  cd asset_it_support_spring_boot && ./mvnw spring-boot:run"
	@echo "  2. Frontend: cd asset_it_support_nextjs && npm run dev"

install-frontend:
	@echo "📦 Installing Next.js dependencies..."
	cd asset_it_support_nextjs && npm install
	@echo "✅ Frontend dependencies installed"

install-backend:
	@echo "📦 Downloading Maven dependencies..."
	cd asset_it_support_spring_boot && ./mvnw dependency:resolve
	@echo "✅ Backend dependencies downloaded"

# Database Commands
db-backup:
	@echo "💾 Backing up database..."
	@mkdir -p backups
	docker-compose exec -T mysql mysqldump -u root -p$${MYSQL_ROOT_PASSWORD:-rootpassword} db_asset > backups/backup_$$(date +%Y%m%d_%H%M%S).sql
	@echo "✅ Backup created in backups/ directory"

db-restore:
	@if [ -z "$(FILE)" ]; then \
		echo "❌ Error: Please specify FILE=backup.sql"; \
		exit 1; \
	fi
	@echo "📥 Restoring database from $(FILE)..."
	docker-compose exec -T mysql mysql -u root -p$${MYSQL_ROOT_PASSWORD:-rootpassword} db_asset < $(FILE)
	@echo "✅ Database restored"

# Utility Commands
env-example:
	@if [ ! -f .env ]; then \
		echo "📝 Creating .env from env.example..."; \
		cp env.example .env; \
		echo "✅ .env created! Please edit it with your settings."; \
	else \
		echo "⚠️  .env already exists. Delete it first if you want to recreate."; \
	fi

# Quick start (first time setup)
setup: env-example
	@echo "🚀 First time setup..."
	@echo "📝 Please edit .env file with your settings"
	@echo "Then run: make up-build"

# Test commands
test:
	@echo "🧪 Running tests..."
	@echo "Backend tests:"
	cd asset_it_support_spring_boot && ./mvnw test
	@echo "Frontend tests: (if configured)"
	cd asset_it_support_nextjs && npm test || echo "No tests configured"

