

curl -s https://packagecloud.io/install/repositories/altinity/clickhouse/script.rpm.sh | sudo bash

yum install -y clickhouse-server clickhouse-client

sudo /etc/init.d/clickhouse-server restart

#echo  "ClickHouse 配置主机HOST ，请输入主机IP：  [/N] :"
#while read line
#do
#    id=`echo $line | awk '{print $1}'`
#    sed -i 's/192.168.1.12/$id/g' clickhouse-config.xml
#    break;
#done

host=ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"
sed -i 's/192.168.1.12/'"$host"'/g' clickhouse-config.xml


cp -r clickhouse-config.xml /etc/clickhouse-server/config.xml
cp -r clickhouse-cluster.xml /etc/clickhouse-server/cluster.xml
cp -r clickhouse-user.xml /etc/clickhouse-server/users.xml

/etc/init.d/clickhouse-server restart

tail -f tail -f /var/log/clickhouse-server/*


