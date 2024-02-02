FROM debian:11

# Installation de wget
RUN apt-get update -y && \
	apt-get -y install wget

# Installation de php et ses dependances
RUN apt-get install -y php-fpm \
	php-mysql \
	mariadb-client

# Copie du fichier de configuration dans le container
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN	wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh
CMD ["bash", "/usr/local/bin/auto_config.sh"]

EXPOSE 9000