FROM php:7.0-apache
MAINTAINER Micalgenus <micalgenus@gmail.com>

RUN apt-get update
RUN apt-get install -y libpng-dev unzip

COPY scripts/entrypoint.sh /entrypoint.sh

COPY xe.zip /
WORKDIR /
RUN unzip xe.zip

RUN a2enmod rewrite
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]

EXPOSE 80
EXPOSE 443
