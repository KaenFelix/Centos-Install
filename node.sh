#!/bin/bash

GREEN_COLOR='\033[32m' #绿
YELOW_COLOR='\033[33m' #黄
BLUE_COLOR='\033[36m' #蓝
RES='\033[0m'
underline='\033[4m'
oldpath=$(cd "$(dirname "$0")"; pwd);
type=$(getconf LONG_BIT);

echo -e "\n"
echo -ne "请输入安装位置${BLUE_COLOR}[默认为当前用户文件夹]${RES}："
read installPath

if [ ! -d $installPath ]; then
  echo -e "\n"
  echo -e "${YELOW_COLOR}路径错误,请重新执行shell${RES}"
  exit
fi

echo -e "\n"
echo -e "Node官网下载地址：${underline}${BLUE_COLOR}https://nodejs.org/zh-cn/download/releases/${RES}";
echo -e "\n"
if (($type==64)); then
    echo -e "Node稳定版：${GREEN_COLOR}10.15.3${RES}";
    echo -e "\n"
    echo -e "Node最新版：${GREEN_COLOR}11.12.0${RES}";
else
    $type = 86;
    echo -e "32位系统建议安装Node.js 8.x以下版本如${GREEN_COLOR}8.15.1${RES}";
fi
echo -e "\n"
echo -e "系统版本：${GREEN_COLOR}x${type}${RES}"
echo -e "\n"
echo -n "请输入需要安装的Node版本号："
read v

echo -e "\n"

cd $installPath

echo -e "\n"

# 拆分

OLD_IFS="$IFS"
IFS="."
temp=($v)
IFS="$OLD_IFS"

echo "https://nodejs.org/download/release/v"${temp[0]}"/node-v"${v}"-linux-x"${type}".tar.gz"

echo -e "\n"

wget "https://nodejs.org/download/release/v"${temp[0]}"/node-v"${v}"-linux-x"${type}".tar.gz"

tar -zxf "node-v"${v}"-linux-x"${type}".tar.gz"

rm -rf "node-v"${v}"-linux-x"${type}".tar.gz"

cd "node-v"${v}"-linux-x"${type}'/bin'

cur_dir=$(cd "$(dirname "$0")"; pwd);

rm -rf /usr/local/bin/npm
rm -rf /usr/local/bin/node
rm -rf /usr/local/bin/yarn

ln -s $cur_dir"/node" "/usr/local/bin/node";

ln -s $cur_dir"/npm" "/usr/local/bin/npm";

npm i -g yarn

ln -s $cur_dir"/yarn" "/usr/local/bin/yarn";

cd ${oldpath}

echo -e "\n"

echo -e "Node"${GREEN_COLOR}${v}${RES}"安装完成"

echo -e "\n"