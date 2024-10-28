# setup.sh
#!/bin/bash

# Run Composer Install
composer install

# Run Laravel Migrations
php artisan migrate

# Clear and optimize the cache
php artisan optimize:clear