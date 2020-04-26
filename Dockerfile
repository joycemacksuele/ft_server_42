FROM debian:buster

MAINTAINER Joyce Freitas <jfreitas@student.19.fr>

RUN apt-get update && apt-get -y install wget

# Install php
RUN apt-get -y install php7.3-fpm php7.3-mbstring php7.3-gd php7.3-cli php7.3-mysql

# Install Nginx web server - that will also create /var/www
RUN apt-get -y install nginx
# Create the root web directory for localhost
RUN mkdir /var/www/localhost

# Set www-data (the Linux user profile that web servers use for normal operations) as the owner of what in inside www
# That is part of the configuration of Nginx to use PHP
RUN chown -R www-data:www-data /var/www/*

# 755 =  u=rwx,go=rx (only user/owner can write)
RUN chmod -R 755 /var/www/*

# Install MariaDB database management system
RUN apt-get -y install mariadb-server

# SSL
RUN mkdir /etc/nginx/ssl
RUN apt-get -y install openssl
RUN cd /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=75017/O=42 school/CN=localhost"
RUN cd /

# Configuring Nginx to use PHP
# basic_nginx.conf file  will only respond to requests to the host or IP address provided after server_name, and any files ending in .php will be processed by php-fpm before Nginx sends the results to the user
COPY srcs/basic_nginx.conf /etc/nginx/sites-available/localhost
# COPY  will chage the name of the file basic_nginx.conf to localhost, because localhost does not exist as a directory or file
# Activate configuration by linking to the .conf file
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
# tmp directory where phpMyAdmin will store its temporary files
RUN mkdir /var/www/localhost/phpmyadmin/tmp
RUN chmod -R o=wxr /var/www/localhost/phpmyadmin/tmp

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
CMD bash /tmp/init.sh && tail -f /dev/null
# `tail -f` /dev/null keeps the container up. It's usually added because the process (pid 1) in your docker container is not running in the foreground and if nothing is running in the foreground, docker automatically closes itself
# The `-f` option causes tail to not stop when end of file is reached, but rather to wait for additional data to be appended to the input
