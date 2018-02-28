#!/bin/bash
set -eo pipefail

php artisan config:cache
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

exit 0
