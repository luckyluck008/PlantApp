@echo off
REM PlantApp - Helper Script

if "%1"=="" goto help
if "%1"=="help" goto help
if "%1"=="up" goto up
if "%1"=="down" goto down
if "%1"=="start" goto start
if "%1"=="restart" goto restart
if "%1"=="logs" goto logs
if "%1"=="shell" goto shell
if "%1"=="artisan" goto artisan
goto help

:help
echo PlantApp - Befehle
echo.
echo   dev up         - Starte alle Container
echo   dev start      - Starte Backend + Frontend Server
echo   dev down       - Stoppe alle Container
echo   dev restart    - Starte alle Container neu
echo   dev logs       - Zeige Container-Logs
echo   dev shell      - Offne Shell im App-Container
echo   dev artisan    - Fuhre Laravel Artisan Befehl aus (z.B. dev artisan migrate)
echo.
goto end

:up
docker-compose -f .devcontainer\docker-compose.yml up -d
echo Container wurden gestartet!
goto end

:down
docker-compose -f .devcontainer\docker-compose.yml down
echo Container wurden gestoppt!
goto end

:start
echo Starting PlantApp...
start "PlantApp Backend" cmd /k "docker-compose -f .devcontainer\docker-compose.yml exec app bash -c 'cd backend && php artisan serve --host=0.0.0.0 --port=8000'"
timeout /t 2 /nobreak >nul
start "PlantApp Frontend" cmd /k "docker-compose -f .devcontainer\docker-compose.yml exec app bash -c 'cd frontend && npm start'"
echo Backend + Frontend gestartet!
goto end

:restart
docker-compose -f .devcontainer\docker-compose.yml restart
echo Container wurden neu gestartet!
goto end

:logs
docker-compose -f .devcontainer\docker-compose.yml logs -f
goto end

:shell
docker-compose -f .devcontainer\docker-compose.yml exec app bash
goto end

:artisan
shift
docker-compose -f .devcontainer\docker-compose.yml exec app php backend/artisan %*
goto end

:end

