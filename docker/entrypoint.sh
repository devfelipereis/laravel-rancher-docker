#!/bin/bash
set -eo pipefail

if [ ! -f ".env" ]
then
    echo "Error: .env not found."
    exit 1
fi

composer install
chown -R nginx:nginx /var/www
php artisan config:cache
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

exit 0
