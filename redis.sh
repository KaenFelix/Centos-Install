wget http://120.52.51.18/download.redis.io/releases/redis-5.0.4.tar.gz
tar -zxf redis-4.0.6.tar.gz
yum install gcc -y
cd redis-5.0.4
make MALLOC=libc
cd src && make install
./redis-server