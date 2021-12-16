#!/bin/sh

php-fpm &
nginx &
wait -n

# Exit with status of process that exited first
exit $?
