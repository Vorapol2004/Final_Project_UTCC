# PowerShell Script for Docker Commands
# Usage: .\docker.ps1 <command>
# Example: .\docker.ps1 up

param(
    [Parameter(Position=0)]
    [string]$Command = "help"
)

function Show-Help {
    Write-Host "🚀 Final Project UTCC - Docker Commands (PowerShell)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Docker Commands:" -ForegroundColor Yellow
    Write-Host "  .\docker.ps1 up              - Start all services"
    Write-Host "  .\docker.ps1 down            - Stop and remove containers"
    Write-Host "  .\docker.ps1 build           - Build Docker images"
    Write-Host "  .\docker.ps1 rebuild         - Rebuild (no cache)"
    Write-Host "  .\docker.ps1 logs            - Show logs"
    Write-Host "  .\docker.ps1 logs-spring     - Show Spring Boot logs"
    Write-Host "  .\docker.ps1 logs-next      - Show Next.js logs"
    Write-Host "  .\docker.ps1 logs-mysql      - Show MySQL logs"
    Write-Host "  .\docker.ps1 restart         - Restart services"
    Write-Host "  .\docker.ps1 ps              - Show container status"
    Write-Host "  .\docker.ps1 clean           - Remove containers and volumes"
    Write-Host "  .\docker.ps1 status          - Show status and URLs"
    Write-Host ""
    Write-Host "Setup:" -ForegroundColor Yellow
    Write-Host "  .\docker.ps1 setup           - First time setup (create .env)"
    Write-Host ""
    Write-Host "Shell Access:" -ForegroundColor Yellow
    Write-Host "  .\docker.ps1 shell-spring    - Access Spring Boot container"
    Write-Host "  .\docker.ps1 shell-next      - Access Next.js container"
    Write-Host "  .\docker.ps1 shell-mysql      - Access MySQL container"
}

function Setup-Env {
    if (-not (Test-Path ".env")) {
        Write-Host "📝 Creating .env from env.example..." -ForegroundColor Green
        Copy-Item "env.example" ".env"
        Write-Host "✅ .env created! Please edit it with your settings." -ForegroundColor Green
    } else {
        Write-Host "⚠️  .env already exists. Delete it first if you want to recreate." -ForegroundColor Yellow
    }
}

function Show-Status {
    Write-Host "📊 Container status:" -ForegroundColor Cyan
    docker-compose ps
    Write-Host ""
    Write-Host "🌐 Service URLs:" -ForegroundColor Cyan
    Write-Host "  Frontend:  http://localhost:3000"
    Write-Host "  Backend:   http://localhost:8080"
    Write-Host "  MySQL:     localhost:3306"
}

switch ($Command.ToLower()) {
    "help" {
        Show-Help
    }
    "setup" {
        Setup-Env
        Write-Host ""
        Write-Host "🚀 Next steps:" -ForegroundColor Cyan
        Write-Host "  1. Edit .env file with your settings"
        Write-Host "  2. Run: .\docker.ps1 up-build"
    }
    "up" {
        Write-Host "🚀 Starting all services..." -ForegroundColor Green
        docker-compose up -d
        Write-Host "✅ Services started!" -ForegroundColor Green
    }
    "down" {
        Write-Host "🛑 Stopping all services..." -ForegroundColor Yellow
        docker-compose down
        Write-Host "✅ Services stopped" -ForegroundColor Green
    }
    "build" {
        Write-Host "🔨 Building Docker images..." -ForegroundColor Cyan
        docker-compose build
        Write-Host "✅ Build complete" -ForegroundColor Green
    }
    "rebuild" {
        Write-Host "🔨 Rebuilding Docker images (no cache)..." -ForegroundColor Cyan
        docker-compose build --no-cache
        Write-Host "✅ Rebuild complete" -ForegroundColor Green
    }
    "up-build" {
        Write-Host "🔨 Building and starting services..." -ForegroundColor Cyan
        docker-compose up -d --build
        Write-Host "✅ Services built and started!" -ForegroundColor Green
    }
    "logs" {
        Write-Host "📋 Showing logs (Ctrl+C to exit)..." -ForegroundColor Cyan
        docker-compose logs -f
    }
    "logs-spring" {
        Write-Host "📋 Showing Spring Boot logs..." -ForegroundColor Cyan
        docker-compose logs -f spring-boot
    }
    "logs-next" {
        Write-Host "📋 Showing Next.js logs..." -ForegroundColor Cyan
        docker-compose logs -f nextjs
    }
    "logs-mysql" {
        Write-Host "📋 Showing MySQL logs..." -ForegroundColor Cyan
        docker-compose logs -f mysql
    }
    "restart" {
        Write-Host "🔄 Restarting all services..." -ForegroundColor Yellow
        docker-compose restart
        Write-Host "✅ Services restarted" -ForegroundColor Green
    }
    "ps" {
        Write-Host "📊 Container status:" -ForegroundColor Cyan
        docker-compose ps
    }
    "status" {
        Show-Status
    }
    "clean" {
        Write-Host "🧹 Cleaning up containers, volumes, and images..." -ForegroundColor Yellow
        docker-compose down -v
        Write-Host "⚠️  All containers and volumes removed!" -ForegroundColor Yellow
    }
    "shell-spring" {
        Write-Host "🐚 Accessing Spring Boot container..." -ForegroundColor Cyan
        docker-compose exec spring-boot sh
    }
    "shell-next" {
        Write-Host "🐚 Accessing Next.js container..." -ForegroundColor Cyan
        docker-compose exec nextjs sh
    }
    "shell-mysql" {
        Write-Host "🐚 Accessing MySQL container..." -ForegroundColor Cyan
        docker-compose exec mysql bash
    }
    default {
        Write-Host "❌ Unknown command: $Command" -ForegroundColor Red
        Write-Host ""
        Show-Help
    }
}

