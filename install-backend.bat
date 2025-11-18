@echo off
REM install-backend.bat - Installiert Laravel

echo Installing Laravel Backend...
echo.

docker-compose -f .devcontainer/docker-compose.yml exec app bash -c "if [ ! -f /workspace/backend/artisan ]; then cd /workspace && composer create-project laravel/laravel temp-backend && rm -rf backend/* backend/.* 2>/dev/null; mv temp-backend/* temp-backend/.* backend/ 2>/dev/null; rm -rf temp-backend; fi && cd /workspace/backend && composer install && php artisan key:generate"

echo.
echo Backend installed! Start with: run-backend

