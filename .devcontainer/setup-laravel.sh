#!/bin/bash

echo "=== PlantApp Setup ==="

# Backend: Laravel installieren
echo "--- Backend Setup ---"
cd /workspace/backend

# Check if Laravel is already installed
if [ ! -f "artisan" ]; then
    echo "Installing Laravel..."
    cd /workspace
    composer create-project laravel/laravel backend
    cd /workspace/backend

    # Set permissions
    chmod -R 775 storage bootstrap/cache

    # Create .env file if it doesn't exist
    if [ ! -f ".env" ]; then
        cp .env.example .env
        php artisan key:generate
    fi

    echo "Laravel installed successfully!"
else
    echo "Laravel is already installed."
    composer install
fi

# Frontend: Expo installieren
echo ""
echo "--- Frontend Setup ---"
cd /workspace/frontend

if [ ! -d "node_modules" ]; then
    echo "Installing Expo and dependencies..."
    npm install
    echo "Expo installed successfully!"
else
    echo "Expo is already installed."
fi

echo ""
echo "=== Setup complete! ==="
echo "Backend: cd backend && php artisan serve --host=0.0.0.0 --port=8000"
echo "Frontend: cd frontend && npm start"


