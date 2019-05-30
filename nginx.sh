yum install -y gcc-c++
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel
wget -c https://nginx.org/download/nginx-1.17.0.tar.gz
tar -zxvf nginx-1.17.0.tar.gz
cd nginx-1.17.0
./configure
./configure
make
make install
ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/