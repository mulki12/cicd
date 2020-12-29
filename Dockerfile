FROM php:7.4-fpm

RUN apt-get update
RUN apt-get install -y libmcrypt-dev openssl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mcrypt mbstring

WORKDIR /generals
COPY . /generals

EXPOSE 3001
