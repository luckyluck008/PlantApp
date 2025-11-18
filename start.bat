@echo off
REM PlantApp - Start Backend + Frontend

echo Starting PlantApp...
echo.

REM Starte Backend in neuem Terminal
echo [1/2] Starting Laravel Backend...
start "PlantApp Backend" cmd /k "cd /d %~dp0 && docker-compose -f .devcontainer\docker-compose.yml exec app bash -c 'cd backend && php artisan serve --host=0.0.0.0 --port=8000'"

timeout /t 2 /nobreak >nul

REM Starte Frontend in neuem Terminal
echo [2/2] Starting Expo Frontend...
start "PlantApp Frontend" cmd /k "cd /d %~dp0 && docker-compose -f .devcontainer\docker-compose.yml exec app bash -c 'cd frontend && npm start'"

echo.
echo PlantApp started!
echo Backend: http://localhost:8000
echo Frontend: Check terminal for QR code
echo.

