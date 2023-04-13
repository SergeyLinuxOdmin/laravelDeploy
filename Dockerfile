FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install git php composer php-xml php-curl curl mc -y

RUN mkdir -p /srv

WORKDIR /srv

RUN git clone https://github.com/laravel/laravel.git

RUN useradd -u 1001 -U -r -d /srv/laravel laravel && chown -R laravel:laravel /srv/laravel

USER laravel

WORKDIR /srv/laravel

RUN composer install

