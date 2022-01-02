#!/bin/bash
set -e
#set -x

cd /var/www

mkdir -p node_modules
chown linuxbrew:linuxbrew node_modules 2> /dev/null || true

mkdir -p vendor
chown linuxbrew:linuxbrew vendor 2> /dev/null || true

mkdir -p /var/www/.composer
chown linuxbrew:linuxbrew /var/www/.composer 2> /dev/null || true

mkdir -p /var/www/.npm
chown linuxbrew:linuxbrew /var/www/.npm 2> /dev/null || true

mkdir -p /var/www/var/cache
chown linuxbrew:linuxbrew /var/www/var/cache 2> /dev/null || true

for i in "$@"; do
    i="${i//\\/\\\\}"
    i="${i//$/\\$}"
    C="$C \"${i//\"/\\\"}\""
done

HOME=/var/www su -p linuxbrew -- -c "exec $C"
