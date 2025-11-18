@echo off
REM install-frontend.bat - Installiert nur Expo Dependencies

echo Installing Expo Frontend...
docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "cd /workspace/frontend && npm install"

echo.
echo Frontend ready! Start with: run-frontend

