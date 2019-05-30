#!/bin/bash

yum install mysql -y

yum install mysql-devel -y

wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

rpm -ivh mysql-community-release-el7-5.noarch.rpm

yum install mysql-community-server -y

service mysqld restart

echo 设置密码：set password for 'root'@'localhost' =password('密码')

echo 远程连接：grant all privileges on *.* to 用户名@'%'identified by '密码'

mysql -u root


# vim /etc/my.cnf

# [mysql]
# default-character-set =utf8