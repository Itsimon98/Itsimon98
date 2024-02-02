#!/bin/bash


if [ ! -f "${WP_PATH}/wp-config.php" ]; then


  wp core download --path=$WP_PATH --allow-root


  wp config create --allow-root \
			  --dbname=$SQL_DATABASE \
              --dbuser=$SQL_USER \
              --dbpass=$SQL_PASSWORD \
              --dbhost=mariadb:3306 \
              --path=$WP_PATH

  wp core install --allow-root \
  			  --url="${WP_URL}" \
              --title="${WP_TITLE}" \
              --admin_user="${WP_ADMIN_USER}" \
              --admin_password="${WP_ADMIN_PASSWORD}" \
              --admin_email="${WP_ADMIN_EMAIL}" \
              --path=$WP_PATH

  wp user create $WP_USER $WP_USER_EMAIL \
  			  --user_pass=$WP_USER_PASSWORD \
              --allow-root \
              --path=$WP_PATH

fi


mkdir -p /run/php
php-fpm7.4 -F
