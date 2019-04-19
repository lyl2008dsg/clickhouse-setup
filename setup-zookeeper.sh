#!/bin/bash

echo setup zookeeper

#wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
#tar -zxvf zookeeper-3.4.13.tar.gz



cat <<EOF>> ~/.bash_profile
export ZOOKEEPER_HOME=$PWD/zookeeper-3.4.13
export PATH=$PATH:$PWD/zookeeper-3.4.13/bin:$PWD/zookeeper-3.4.13/conf
EOF

cat ~/.bash_profile

source ~/.bash_profile

zkServer.sh stop
rm -rf /data/zookeeper/
mkdir -p /data/zookeeper/

#提示“请输入姓名”并等待30秒，把用户的输入保存入变量name中
index=1;
echo  "请输入Zookeeper集群ip地址 Tip:[172.16.154.245 172.16.154.246 172.16.154.247]  [/N] :"
while read line
do
    ip1=`echo $line | awk '{print $1}'`
    ip2=`echo $line | awk '{print $2}'`
    ip3=`echo $line | awk '{print $3}'`
    echo $ip1 $ip2 $ip3
    # if [ == ] in bash,buf in dash,if [ = ]
    if [ "$ip1" = "N" ];then
       break;
    fi
    if [ -n "$ip1" ];then
     echo $index  index
     echo server.$index=$ip1:2888:3888 >> zoo.cfg
     let index++;
     #((index++));
    fi
    if [ -n "$ip2" ];then
     echo server.$index=$ip2:2888:3888 >> zoo.cfg
     ((index++));
    fi
    if [ -n "$ip3" ];then
     echo server.$index=$ip3:2888:3888 >> zoo.cfg
     ((index++));
    fi

    echo "是否继续输入 [/N]"
done

echo  "请输入Zookeeper集群索引ID  [/N] :"
while read line
do
    id=`echo $line | awk '{print $1}'`
    echo $id >> /data/zookeeper/myid
    break;
done



cp -r zoo.cfg $PWD/zookeeper-3.4.13/conf/


cd $PWD/zookeeper-3.4.13/
zkServer.sh restart
zkServer.sh status
tail -f zookeeper.out
