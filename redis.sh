wget http://download.redis.io/releases/redis-5.0.7.tar.gz
tar -zxf redis-5.0.7.tar.gz
yum install gcc -y
cd redis-5.0.7
make MALLOC=libc
cd src && make install
./redis-server