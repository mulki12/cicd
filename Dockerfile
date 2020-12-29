FROM php:7.4-fpm

RUN apt-get update
RUN apt-get install -y libmcrypt-dev openssl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mcrypt mbstring

WORKDIR /generals
COPY . /generals

RUN composer install

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=3001"]

EXPOSE 3001
