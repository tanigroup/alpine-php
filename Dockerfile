FROM alpine:latest

WORKDIR /var/www

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime \
    && echo "Asia/Jakarta" >  /etc/timezone \
    && apk del tzdata \
    && date

RUN apk --update add \
    php7 \
    php7-mysqli \
    php7-phar \
    php7-zip \
    php7-curl \
    php7-json \
    php7-cgi \
    php7-fpm \
    php7-mbstring \
    php7-dom \
    php7-gd \
    php7-bz2 \
    php7-xml \
    php7-common \
    php7-tokenizer \
    php7-xmlwriter \
    php7-pdo \
    php7-pdo_mysql \
    php7-fileinfo \
    php7-session

RUN apk --update add \
    git \
    wget \
    curl \
    nano \
    gzip \
    nodejs \
    nodejs-npm

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

CMD ["php", "-a"]