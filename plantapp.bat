@echo off
REM PlantApp - Zentrale Steuerung (Backend: Docker, Frontend: Lokal)

if "%1"=="" goto help

REM Container Befehle
if "%1"=="up" goto up
if "%1"=="down" goto down
if "%1"=="shell" goto shell

REM Installation
if "%1"=="install" goto install
if "%1"=="install-backend" goto install_backend
if "%1"=="install-frontend" goto install_frontend

REM Start Befehle
if "%1"=="start" goto start
if "%1"=="backend" goto backend
if "%1"=="frontend" goto frontend

goto help

:help
echo.
echo ========================================
echo   PlantApp - Befehle
echo ========================================
echo.
echo CONTAINER:
echo   plantapp up              Container starten
echo   plantapp down            Container stoppen
echo   plantapp shell           Terminal im Container
echo.
echo INSTALLATION (einmalig):
echo   plantapp install         Backend + Frontend installieren
echo   plantapp install-backend Nur Backend installieren
echo   plantapp install-frontend Nur Frontend installieren
echo.
echo ENTWICKLUNG:
echo   plantapp start           Backend + Frontend starten
echo   plantapp backend         Nur Backend starten
echo   plantapp frontend        Nur Frontend starten
echo.
echo ========================================
goto end

REM === Container Management ===

:up
echo Starting Docker Container (Backend)...
docker-compose -f .devcontainer/docker-compose.yml up -d
echo.
echo Container gestartet!
echo Nun: plantapp install (beim ersten Mal)
goto end

:down
echo Stopping Docker Container...
docker-compose -f .devcontainer/docker-compose.yml down
echo Container gestoppt!
goto end

:shell
echo Opening Shell in Container...
docker-compose -f .devcontainer/docker-compose.yml exec app bash
goto end

REM === Installation ===

:install
echo.
echo ========================================
echo   Installation: Backend + Frontend
echo ========================================
echo.
call :install_backend
echo.
call :install_frontend
echo.
echo ========================================
echo Installation abgeschlossen!
echo Starten mit: plantapp start
echo ========================================
goto end

:install_backend
echo [1/2] Installing Laravel Backend (Docker)...
docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "if [ ! -f /workspace/backend/artisan ]; then cd /workspace && composer create-project laravel/laravel temp-backend && rm -rf backend/* backend/.* 2>/dev/null; mv temp-backend/* temp-backend/.* backend/ 2>/dev/null; rm -rf temp-backend; fi && cd /workspace/backend && composer install && php artisan key:generate"
echo Backend installiert!
goto :eof

:install_frontend
echo [2/2] Installing Expo Frontend (Local)...
cd frontend
call npm install
cd ..
echo Frontend installiert!
goto :eof

REM === Start Befehle ===

:start
echo.
echo ========================================
echo   Starting PlantApp
echo ========================================
echo.
start "PlantApp Backend (Docker)" cmd /k "docker-compose -f .devcontainer/docker-compose.yml exec app bash -c \"cd /workspace/backend && php artisan serve --host=0.0.0.0 --port=8000\""
timeout /t 2 /nobreak >nul
start "PlantApp Frontend (Local)" cmd /k "cd frontend && npm start"
echo.
echo Backend + Frontend gestartet!
echo.
echo Backend (Docker):  http://localhost:8000
echo Frontend (Local):  Check terminal for QR code
echo.
goto end

:backend
echo Starting Backend (Docker)...
docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "cd /workspace/backend && php artisan serve --host=0.0.0.0 --port=8000"
goto end

:frontend
echo Starting Frontend (Local)...
cd frontend
call npm start
goto end

:end

