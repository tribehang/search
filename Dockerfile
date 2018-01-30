FROM tribehang/php-container:latest

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install

ADD . /var/www/html

RUN composer config --global github-oauth.github.com f9b46d6d520c614d10b909991a0303b5c4df014b && \
    composer install --no-dev --no-interaction --no-progress --optimize-autoloader

EXPOSE 80 443

CMD ["/bin/bash", "docker/run.sh"]