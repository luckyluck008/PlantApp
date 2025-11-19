FROM php:8.2-fpm

# Install system dependencies (nur für Laravel/PHP)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip


# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /workspace

# Create www-data user with proper permissions
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Install Laravel installer globally
RUN composer global require laravel/installer

# Add composer global bin to PATH
ENV PATH="${PATH}:/root/.composer/vendor/bin"

