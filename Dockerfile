FROM nginx

RUN apt update -y &&\
    apt install -y php php-fpm

COPY ./app/ /var/www/html/

COPY ./docker/nginx.conf /etc/nginx/

COPY ./docker/start.sh /

CMD ["/start.sh"]