FROM debian:buster

MAINTAINER Joyce Freitas <jfreitas@student.19.fr>

RUN apt-get update && apt-get -y install wget

# Install php
RUN apt-get -y install php7.3-fpm php7.3-mbstring php7.3-gd php7.3-cli php7.3-mysql

# Install Nginx web server - that will create /var/www too
RUN apt-get -y install nginx
RUN mkdir /var/www/localhost

# Install MariaDB database management system
RUN apt-get -y install mariadb-server

# Set www-data as the owner of what in inside www
RUN chown -R www-data /var/www/*
# 755 =  u=rwx,go=rx (only user/owner can write)
RUN chmod -R 755 /var/www/*

# SSL
RUN mkdir /etc/nginx/ssl
RUN apt-get -y install openssl
RUN cd /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=75017/O=42 school/CN=localhost"
RUN cd /

# Nginx
COPY srcs/basic_nginx.conf /etc/nginx/sites-available/localhost
# it will chage the name of the fime basic_nginx.conf to localhost, because localhost does not exist as a directory or file
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled

# phpinfo page
RUN mkdir /var/www/localhost/phpinfo
RUN touch /var/www/localhost/phpinfo/index.php
RUN echo "<?php\nphpinfo(); ?>" >> /var/www/localhost/phpinfo/index.php

# phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
RUN mkdir /var/www/localhost/phpmyadmin
RUN tar -xvf phpMyAdmin-latest-english.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin
COPY srcs/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# Wordpress
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
# It will extract a folder called wordpress with all files inside
# -f = Read the archive from or write the archive to the specified file.
RUN mv wordpress/ /var/www/localhost/
COPY srcs/wp-config.php /var/www/localhost/wordpress/

# COPY - add directories and files to your container's /tmp/ directory
COPY srcs/init.sh /tmp/

# CMD - specify what component is to be run by your image
CMD bash /tmp/init.sh
