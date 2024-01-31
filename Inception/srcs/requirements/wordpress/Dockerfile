FROM debian:bullseye
RUN apt-get update && apt-get -y install \
wget \
curl \
bash \
php \
php-fpm \
php-mysql
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./conf/wp-config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wp-config.sh
ENTRYPOINT ["/usr/local/bin/wp-config.sh"]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]