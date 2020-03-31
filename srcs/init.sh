# MySQL
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin='mysql_native_password' where user='user';" | mysql -u root

rm phpMyAdmin-latest-english.tar.gz
rm latest.tar.gz

service php7.3-fpm start
service nginx start
service mysql reload
bash
