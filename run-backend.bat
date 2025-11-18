@echo off
REM run-backend.bat - Startet Backend Server

docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "cd /workspace/backend && php artisan serve --host=0.0.0.0 --port=8000"

