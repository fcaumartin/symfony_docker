#!/usr/bin/env bash
 
composer install -n
bin/console d:d:d --force --if-exists
bin/console d:d:c
bin/console d:s:u --force
bin/console doc:fix:load --append
 
exec "$@"