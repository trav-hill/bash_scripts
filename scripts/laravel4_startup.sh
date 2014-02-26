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
echo "<VirtualHost *:80>
   ServerName edos.io
   DocumentRoot /var/www/edos.io/public

   <Directory /var/www/edos.io/public>
    <IfModule mod_rewrite.c>
    Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f 
    RewriteRule ^ index.php [L]
   </IfModule>
</Directory>
</VirtualHost>" >> /etc/httpd/conf/httpd.conf
service httpd restart
