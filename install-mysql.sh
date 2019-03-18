#!/bin/bash

yum install mysql

yum install mysql-devel

wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

rpm -ivh mysql-community-release-el7-5.noarch.rpm

yum install mysql-community-server

service mysqld restart

echo '设置root密码'
read password

mysql -u root

set password for 'root'@'localhost' =password($password);

grant all privileges on *.* to root@'%'identified by 'password';

vim /etc/my.cnf

[mysql]
default-character-set =utf8