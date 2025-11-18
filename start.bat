@echo off
REM PlantApp - Start Backend + Frontend

echo Starting PlantApp...
echo.

start "PlantApp Backend" cmd /k "docker-compose -f .devcontainer/docker-compose.yml exec app bash -c \"cd /workspace/backend && php artisan serve --host=0.0.0.0 --port=8000\""

timeout /t 2 /nobreak >nul

start "PlantApp Frontend" cmd /k "docker-compose -f .devcontainer/docker-compose.yml exec app bash -c \"cd /workspace/frontend && npm start\""

echo.
echo Backend + Frontend gestartet!
echo Backend: http://localhost:8000
echo Frontend: Check terminal for QR code


