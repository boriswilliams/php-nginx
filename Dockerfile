FROM registry.access.redhat.com/ubi9/nginx-122@sha256:8ee7d281b763ff3aaee701babee0411d0ecc0726d7b85d3ad25183a51abe5b6b

USER root

RUN yum update -y &&\
    yum install -y php php-fpm

COPY ./app/ /var/www/html/

COPY ./docker/nginx.conf /etc/nginx/

COPY ./docker/start.sh /

RUN groupadd -r www-data && useradd -r -g www-data www-data

RUN mkdir /run/php-fpm

ARG USER=www-data

RUN chown -R ${USER}:${USER} /var/log/nginx
RUN chown -R ${USER}:${USER} /var/lib/nginx
RUN chown -R ${USER}:${USER} /run
RUN chown -R ${USER}:${USER} /var/log/php-fpm

USER ${USER}

CMD ["/start.sh"]