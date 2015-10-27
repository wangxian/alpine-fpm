FROM alpine:latest
MAINTAINER WangXian <xian366@126.com>

ADD php-fpm.conf /etc/php/

WORKDIR /app
VOLUME /app

RUN apk --update add \
        git curl openssl \
        php-fpm php-mcrypt php-curl php-gd php-json php-openssl \
        php-pdo_mysql php-pdo_sqlite php-phar php-iconv \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /app/logs \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


EXPOSE 9000
CMD ["php-fpm", "-F"]
