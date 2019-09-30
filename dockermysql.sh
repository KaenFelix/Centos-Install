docker pull mysql
mkdir -p docker_v/mysql/conf
cd docker_v/mysql/conf
touch my.cnf
docker run -p 3306:3306 --name mysql -v /opt/docker_v/mysql/conf:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

 FLUSH PRIVILEGES;
