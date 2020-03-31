# ft_server_42

## - Run those 2 commands whe everything is ready

### To build your image from your Dockerfile first: docker build -t jfreitas/ft_server .
######      -t (tag) to specify the name of the image. Being the first part your name/then the image name
######      the . to specify the directory where docker build should be looking for a Dockerfile

### To run your image, creating you container from it: docker run -it -p 80:80 -p 443:443 ft_server
######      -d = detach = runs in the background
######      -p = publish

#### Notes - Notion
- https://www.notion.so/ft_server-ca620d93038d4e32a8905d0fd049fdb5

#### ft_server 42 subject
- https://cdn.intra.42.fr/pdf/pdf/9751/en.subject.pdf

#### Autoindex
- http://nginx.org/en/docs/http/ngx_http_autoindex_module.html

----------------------------

## Tutorials 

#### How To Install Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10
- https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10

----------------------------

## Docker

#### Dockerfile tutorial
- https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/

#### Get Docker Engine - Community for Debian
- https://docs.docker.com/install/linux/docker-ce/debian/

#### Docker docs
- https://docs.docker.com/machine/reference/env/

----------------------------

## SSL

#### Creating a Self-Signed SSL Certificate
- https://linuxize.com/post/creating-a-self-signed-ssl-certificate/

#### Créer et Installer un certificat SSL sous NGinx
- https://admin-serv.net/blog/670/creer-et-installer-un-certificat-ssl-sous-nginx/

#### How To Create a Self-Signed SSL Cert for Nginx on Debian 10
- https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10

----------------------------

## Nginx

#### Nginx documentation
- https://nginx.org/en/docs/

#### Nginx download
- https://nginx.org/en/download.html

#### Nginx - Web Server
- https://docs.nginx.com/nginx/admin-guide/web-server/

----------------------------

## phpMyAdmin

#### How To Install phpMyAdmin with Nginx on Debian 10
- https://www.itzgeek.com/how-tos/linux/debian/how-to-install-phpmyadmin-with-nginx-on-debian-10.html

#### How To Install phpMyAdmin From Source on Debian 10
- https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10

----------------------------

## WordPress

#### How To Install WordPress with LEMP (Nginx, MariaDB and PHP) on Debian 10
- https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10

----------------------------

## Debian

#### Configuring Apt Sources (if needed)
- https://wiki.debian.org/SourcesList

#### Debian GNU/Linux Installation Guide (just for reading and knowlegment)
- https://www.debian.org/releases/stable/i386/index.en.html
