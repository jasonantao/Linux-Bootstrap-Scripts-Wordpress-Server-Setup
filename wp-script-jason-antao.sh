#!/bin/bash
sudo su
yum update -y
yum install httpd php php-mysql stress -y
cd /etc/httpd/conf
cp httpd.conf httpdconfbackup.conf
rm -rf httpd.conf
#Using free REPOSITORY BELOW:
wget https://s3-eu-west-1.amazonaws.com/acloudguru-wp/httpd.conf
cd /var/www/html
echo "healthy" > healthy.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
service httpd start
chkconfig httpd on
#------------------------------------------------------------------
#NOW INCREASINING THE MAXIMUM UPLOAD SIZE

cd /var/www/html

nano wp-config.php

echo "@ini_set( 'upload_max_size' , '12M' );" >> wp-config.php
echo "@ini_set( 'post_max_size', '13M');" >> wp-config.php
echo "@ini_set( 'memory_limit', '15M' );" >> wp-config.php
------------------------------------------------------------------
echo >> define('WP-DEBUG', false);
echo >> define('FTP_USER', 'root');
echo >> define('FTP_PASS', 'username');
echo >> define('FTP_HOST', 'username.czai8ry0q7za.us-east-1.rds.amazonaws.com:21');
echo >> define('FTP_SSL', false);
#------------------------------------------------------------------
sudo apt-get update
sudo apt-get install php5-gd
sudo service apache2 restart
yum install httpd php php-mysql stress -y
cd /etc/httpd/conf
cp httpd.conf httpdconfbackup.conf
rm -rf httpd.conf
wget https://s3-eu-west-1.amazonaws.com/acloudguru-wp/httpd.conf
cd /var/www/html
echo "healthy" > healthy.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
service httpd start
chkconfig httpd on
