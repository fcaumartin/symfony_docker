FROM php:8.3-apache

RUN a2enmod rewrite

RUN apt-get update
RUN apt install -y libzip-dev git wget --no-install-recommends
RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN docker-php-ext-install pdo mysqli pdo_mysql zip;

RUN wget https://getcomposer.org/installer -O /var/www/composer-setup.php
RUN php /var/www/composer-setup.php 
RUN mv composer.phar /usr/bin/composer 
RUN chmod +x /usr/bin/composer
 
COPY apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY entrypoint.sh /entrypoint.sh

# COPY . /var/www
 
WORKDIR /var/www

RUN chmod +x /entrypoint.sh

CMD ["apache2-foreground"]

# ENTRYPOINT ["/entrypoint.sh"]