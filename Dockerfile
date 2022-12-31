FROM php:8.1.11-apache

RUN apt-get update
RUN apt-get install zip -y
RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer​ | php -- \
     --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN echo 'running composer install'
RUN composer install
RUN echo 'running php artisan key:generate'
RUN php artisan key:generate
