FROM alpine:latest
MAINTAINER WangXian <xian366@126.com>

RUN apk --update add \
        git curl openssl \
        php-fpm php-mcrypt php-curl php-gd php-json php-openssl \
        php-mysql php-mysqli php-pdo_mysql php-pdo_sqlite php-phar php-iconv \
  && rm -rf /var/cache/apk/* \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
VOLUME /app

ADD php-fpm.conf /etc/php/
ADD logs logs

EXPOSE 9000
CMD ["php-fpm", "-F"]
