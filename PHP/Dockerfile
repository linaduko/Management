FROM php:8.0-fpm

ENV DEBIAN_FRONTEND noninteractive

RUN set -eux; \
    apt-get update; \
    pecl channel-update pecl.php.net \
    apt-get upgrade -y; \
    apt-get install -y --no-install-recommends \
            apt-utils \
            gnupg2 \
            git \
            curl \
            libmemcached-dev \
            libz-dev \
            libpq-dev \
            libjpeg-dev \
            libpng-dev \
            libfreetype6-dev \
            libssl-dev \
            libwebp-dev \
            libxpm-dev \
            libmcrypt-dev \
            libonig-dev; \    
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    # Install the PHP pdo_mysql extention
    docker-php-ext-install pdo_mysql; \
    # Install the PHP gd library
    docker-php-ext-configure gd \
            --prefix=/usr \
            --with-jpeg \
            --with-webp \
            --with-xpm \
            --with-freetype; \
    docker-php-ext-install gd; \
    php -r 'var_dump(gd_info());'
 
RUN pecl install redis-5.3.7 \
    rm -rf /tmp/pear \
    docker-php-ext-enable redis


