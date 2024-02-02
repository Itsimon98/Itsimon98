FROM debian:11

ARG WP_PATH
ARG WP_URL

RUN apt update
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install gettext -y
RUN apt install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=RM/ST=ROME/L=ROME/O=42/OU=42/CN=sfarina.42.fr/UID=sfarina"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf.template

RUN export WP_PATH=$WP_PATH WP_URL=$WP_URL
RUN envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 443
