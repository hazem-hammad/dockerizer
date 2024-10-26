# Use the official PHP image as the base
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    build-essential \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    curl \
    nano \
    cron \
    supervisor \
    rsyslog \
    sudo \
    dos2unix \
    procps \
    git \
    ffmpeg \
    libmagickwand-dev

# Clear the cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip exif pcntl

# If the application requires image manipulation or you are using libraries such as Intervention Image or other similar packages
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# This command installs the gd extension, using multiple cores (-j$(nproc)) to speed up the compilation process based on the number of available CPU cores
# This extension is commonly required for image-related operations, such as resizing, cropping, and generating CAPTCHA images
RUN docker-php-ext-install -j$(nproc) gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy php.ini configuration file
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

# Copy existing application directory contents
COPY . /var/www

# Set ownership and permissions for the storage and bootstrap/cache directories
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 777 /var/www/storage /var/www/bootstrap/cache

# The EXPOSE instruction in a Dockerfile is used to inform Docker that the container will listen on the specified network port at runtime
# The container will make port 9000 available for connections, which is the default port for PHP-FPM
EXPOSE 9000

# The CMD instruction in a Dockerfile specifies the command that will be executed when a container starts
# In this case, the command is php-fpm, which stands for PHP FastCGI Process Manager. It runs the PHP server process and listens for incoming requests, typically from a web server like Nginx.
# php-fpm is responsible for handling PHP code execution. It acts as an application server that listens for incoming FastCGI requests from Nginx or Apache, executes the PHP scripts, and returns the output.
CMD ["php-fpm"]
