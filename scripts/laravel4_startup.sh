######
# Current steps to build Laravel4 server in AWS
yum update -y
yum install php55 php55-mcrypt mysql-server -y
yum install phpmyadmin --enablerepo=epel
service httpd start
service mysqld start
chkconfig httpd on
chkconfig mysqld on
curl -k -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/sbin/composer
wget https://github.com/laravel/laravel/archive/develop.zip
unzip develop.zip
mv laravel-develop/ /var/www/edos.io
rm -f develop.zip
cd /var/www/edos.io
composer install
chmod apache:apache -R app/storage
echo -e "<VirtualHost *:80> \n  ServerName yoursite.com \n  DocumentRoot /var/www/yoursite/public \n\n  <Directory /var/www/yoursite/public> \n    <IfModule mod_rewrite.c>\n    Options -MultiViews\n    RewriteEngine On\n    RewriteCond %{REQUEST_FILENAME} !-f\n    RewriteRule ^ index.php [L]\n   </IfModule>\n</Directory>\n</VirtualHost>" >> <VirtualHost *:80> >> /etc/httpd/conf/httpd.conf
service httpd restart
