#!/bin/bash

let oldpath=$(cd "$(dirname "$0")"; pwd);

let type=$(getconf LONG_BIT);

echo https://nodejs.org/zh-cn/download/releases/

echo 当前版本为：$type
echo -n "请输入Node版本号："
read v

echo -n "请输入Node版本位数64/32："
read nodetype

OLD_IFS="$IFS"
IFS="."
temp=($v)
IFS="$OLD_IFS"

wget "https://nodejs.org/dist/latest-v"${temp[0]}".x/node-v"${v}"-linux-x"${nodetype}".tar.gz"

tar -zxvf "node-v"${v}"-linux-x"${nodetype}".tar.gz"

cd "node-v"${v}"-linux-x"${nodetype}

let cur_dir=$(cd "$(dirname "$0")"; pwd);

ln -s $cur_dir"/node" "/usr/local/bin/node";

ln -s $cur_dir"/npm" "/usr/local/bin/npm";

npm i -g yarn

ln -s $cur_dir"/yarn" "/usr/local/bin/yarn";

cd ${oldpath}

rm -rf "node-v"${v}"-linux-x"${nodetype}".tar.gz"

echo "Node"${v}"安装完成"