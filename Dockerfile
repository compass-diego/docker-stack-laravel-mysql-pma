FROM php:8.1.11-apache

RUN apt-get update && \
    apt-get install unzip zip nano -y

RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer | php -- \
     --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN composer install
RUN composer update
RUN composer dump-autoload
RUN cp .env.example .env
RUN php artisan key:generate
