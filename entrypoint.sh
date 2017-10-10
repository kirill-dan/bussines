#!/bin/bash -e

if [ ! -f app/config/parameters.yml ]; then 
	cp app/config/parameters.yml.dist app/config/parameters.yml
fi

#composer install --no-interaction

#php bin/console --no-interaction doctrine:database:drop --force
#php bin/console --no-interaction doctrine:database:create
#php bin/console --no-interaction doctrine:migrations:migrate

chmod -R 777 /var/www/symfony3/
chown -R www-data:www-data /var/www/symfony3/var/cache
chown -R www-data:www-data /var/www/symfony3/var/logs

php-fpm7.0 -F
