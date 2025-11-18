@echo off
REM PlantApp - Helper Script

if "%1"=="" goto help
if "%1"=="up" goto up
if "%1"=="down" goto down
if "%1"=="shell" goto shell
if "%1"=="start" goto start
goto help

:help
echo PlantApp - Befehle
echo.
echo   dev up       - Container starten
echo   dev down     - Container stoppen
echo   dev shell    - Terminal im Container
echo   dev start    - Backend + Frontend starten
echo.
goto end

:up
echo Starting DevContainer...
docker-compose -f .devcontainer/docker-compose.yml up -d
echo Container gestartet!
goto end

:down
echo Stopping DevContainer...
docker-compose -f .devcontainer/docker-compose.yml down
echo Container gestoppt!
goto end

:shell
echo Opening Shell...
docker-compose -f .devcontainer/docker-compose.yml exec app bash
goto end

:start
echo Starting Backend + Frontend...
start "PlantApp Backend" cmd /k "docker-compose -f .devcontainer/docker-compose.yml exec app bash -c \"cd /workspace/backend && php artisan serve --host=0.0.0.0 --port=8000\""
timeout /t 2 /nobreak >nul
start "PlantApp Frontend" cmd /k "docker-compose -f .devcontainer/docker-compose.yml exec app bash -c \"cd /workspace/frontend && npm start\""
echo Backend + Frontend gestartet!
goto end

:end

