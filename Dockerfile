FROM php:7.3-cli-alpine3.9
LABEL maintainer="Tristan Kenney <tristan@kenney.co>"

WORKDIR /usr/src/app

COPY engine.json ./
COPY composer.json composer.lock ./
COPY . /usr/src/app
COPY xdebug.ini $PHP_INI_DIR/conf.d/

RUN apk add --no-cache curl && \
    curl -sS https://getcomposer.org/installer | php && \
    ./composer.phar install --no-dev --optimize-autoloader && \
    rm composer.phar && \
    apk del curl && \
    chmod +x /usr/src/app/bin/engine

RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

RUN adduser -u 9000 -D app
USER app


VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/engine"]