FROM php:7.4-fpm

RUN apt-get update -y && apt-get install -y libmcrypt-dev openssl
RUN docker-php-ext-install pdo mcrypt mbstring

RUN apt-get -y curl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /generals
WORKDIR /generals

COPY . /generals

RUN composer install

CMD php artisan migrate:fresh
CMD php artisan serve

EXPOSE 3001
