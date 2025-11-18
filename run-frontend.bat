@echo off
REM run-frontend.bat - Startet Frontend Server

docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "cd /workspace/frontend && npm start"

