-- host 1
create database IF NOT EXISTS shanhui_shard_1;
use shanhui_shard_1;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard1/replica', 'replica_1') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;
create database IF NOT EXISTS shanhui_shard_3;
use shanhui_shard_3;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard3/replica', 'replica_2') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;

-- drop
use shanhui_shard_1;
drop table `app_log`;
use shanhui_shard_3;
drop table `app_log`;


-- delete
alert table  shanhui_shard_1.app_log delete where  1=1;
alert table  shanhui_shard_3.app_log delete where  1=1;

-- 校验
use shanhui_shard_1;
desc app_log;
select * from app_log;
use shanhui_shard_3;
desc app_log;
select * from app_log;

-- host 2
create database IF NOT EXISTS shanhui_shard_2;
use shanhui_shard_2;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard2/replica', 'replica_1') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;
create database IF NOT EXISTS shanhui_shard_1;
use shanhui_shard_1;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard1/replica', 'replica_2') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;


-- drop
use shanhui_shard_2;
drop table `app_log`;
use shanhui_shard_1;
drop table `app_log`;


-- 校验
use shanhui_shard_2;
desc app_log;
select * from app_log;
use shanhui_shard_1;
desc app_log;
select * from app_log;

-- host 3
create database IF NOT EXISTS shanhui_shard_3;
use shanhui_shard_3;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard3/replica', 'replica_1') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;
create database IF NOT EXISTS shanhui_shard_2;
use shanhui_shard_2;
CREATE TABLE app_log (shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_shanhui_shard2/replica', 'replica_2') PARTITION BY toYYYYMMDD(shTranTime) ORDER BY (shUuid, shTranChannel, orgId) SETTINGS index_granularity=8192;

-- drop
use shanhui_shard_3;
drop table `app_log`;
use shanhui_shard_2;
drop table `app_log`;


-- 校验
use shanhui_shard_3;
desc app_log;
select * from app_log;
use shanhui_shard_2;
desc app_log;
select * from app_log;

-- cluster
use default;
select * from cluster_app_log;
CREATE TABLE `cluster_app_log`( shUuid String,shOuuid String,shTranCd String,shCorgMercId String,shMno String,shTranDt String,shTranTm String,shTranTime DateTime,createTime DateTime,incomingTime DateTime,shScanWay String,shTranAmt String,shMercFeeAmt String,shPayDt String,shPayTm String,shCreditLimit String,shInPassword String,shOutBankId String,shBuyer String,shGoodDesc String,shMercName String,shAppid String,shWxsubappid String,shWxmchId String,shWxchannelId String,shWxsubOpenId String,shCorgTxnSts String,shDiscountFee String,shCorgCd String,shTranChannel String,orgId String) ENGINE = Distributed( 'shanhui_3shards_2replicas', '',app_log, rand());
select * from cluster_app_log;

-- insert test

INSERT INTO default.cluster_app_log (shUuid, shOuuid, shTranCd, shCorgMercId, shMno, shTranDt, shTranTm, shTranTime, createTime, incomingTime, shScanWay, shTranAmt, shMercFeeAmt, shPayDt, shPayTm, shCreditLimit, shInPassword, shOutBankId, shBuyer, shGoodDesc, shMercName, shAppid, shWxsubappid, shWxmchId, shWxchannelId, shWxsubOpenId, shCorgTxnSts, shDiscountFee, shCorgCd, shTranChannel, orgId) VALUES ('1', '3123123123', '11', '312312', '31231312', '20190418', '191011', '2019-04-18 11:10:11', '2019-04-19 15:26:59', '2099-01-12 14:36:57', '2323', '3333', '333', '20190418', '191011', '3123132', '1323', '32131', '1001', '123', '123123132', '1001', '2312', '3333', '312', 'ff11', '01', '0.1', '1231312', '', '');
INSERT INTO default.cluster_app_log (shUuid, shOuuid, shTranCd, shCorgMercId, shMno, shTranDt, shTranTm, shTranTime, createTime, incomingTime, shScanWay, shTranAmt, shMercFeeAmt, shPayDt, shPayTm, shCreditLimit, shInPassword, shOutBankId, shBuyer, shGoodDesc, shMercName, shAppid, shWxsubappid, shWxmchId, shWxchannelId, shWxsubOpenId, shCorgTxnSts, shDiscountFee, shCorgCd, shTranChannel, orgId) VALUES ('2', '3123123123', '11', '312312', '31231312', '20190418', '191011', '2019-04-18 11:10:11', '2019-04-19 15:27:03', '2099-01-12 14:37:00', '2323', '3333', '333', '20190418', '191011', '3123132', '1323', '32131', '1001', '123', '123123132', '1001', '2312', '3333', '312', 'ff11', '01', '0.1', '1231312', '', '');
INSERT INTO default.cluster_app_log (shUuid, shOuuid, shTranCd, shCorgMercId, shMno, shTranDt, shTranTm, shTranTime, createTime, incomingTime, shScanWay, shTranAmt, shMercFeeAmt, shPayDt, shPayTm, shCreditLimit, shInPassword, shOutBankId, shBuyer, shGoodDesc, shMercName, shAppid, shWxsubappid, shWxmchId, shWxchannelId, shWxsubOpenId, shCorgTxnSts, shDiscountFee, shCorgCd, shTranChannel, orgId) VALUES ('3', '3123123123', '11', '312312', '31231312', '20190418', '191011', '2019-04-18 11:10:11', '2019-04-19 15:26:59', '2099-01-12 14:36:57', '2323', '3333', '333', '20190418', '191011', '3123132', '1323', '32131', '1001', '123', '123123132', '1001', '2312', '3333', '312', 'ff11', '01', '0.1', '1231312', '', '');
INSERT INTO default.cluster_app_log (shUuid, shOuuid, shTranCd, shCorgMercId, shMno, shTranDt, shTranTm, shTranTime, createTime, incomingTime, shScanWay, shTranAmt, shMercFeeAmt, shPayDt, shPayTm, shCreditLimit, shInPassword, shOutBankId, shBuyer, shGoodDesc, shMercName, shAppid, shWxsubappid, shWxmchId, shWxchannelId, shWxsubOpenId, shCorgTxnSts, shDiscountFee, shCorgCd, shTranChannel, orgId) VALUES ('4', '3123123123', '11', '312312', '31231312', '20190418', '191011', '2019-04-18 11:10:11', '2019-04-19 15:26:42', '2099-01-12 14:36:56', '2323', '3333', '333', '20190418', '191011', '3123132', '1323', '32131', '1001', '123', '123123132', '1001', '2312', '3333', '312', 'ff11', '01', '0.1', '1231312', '', '');
INSERT INTO default.cluster_app_log (shUuid, shOuuid, shTranCd, shCorgMercId, shMno, shTranDt, shTranTm, shTranTime, createTime, incomingTime, shScanWay, shTranAmt, shMercFeeAmt, shPayDt, shPayTm, shCreditLimit, shInPassword, shOutBankId, shBuyer, shGoodDesc, shMercName, shAppid, shWxsubappid, shWxmchId, shWxchannelId, shWxsubOpenId, shCorgTxnSts, shDiscountFee, shCorgCd, shTranChannel, orgId) VALUES ('5', '3123123123', '11', '312312', '31231312', '20190418', '191011', '2019-04-18 11:10:11', '2019-04-19 15:26:50', '2099-01-12 14:36:56', '2323', '3333', '333', '20190418', '191011', '3123132', '1323', '32131', '1001', '123', '123123132', '1001', '2312', '3333', '312', 'ff11', '01', '0.1', '1231312', '', '');




SELECT * FROM system.zookeeper WHERE path = '/clickhouse/cluster_shanhui_shard2/replica/replicas/replica_2';


alter table system.zookeeper delete WHERE path = '/clickhouse/cluster_shanhui_shard2/replica/replicas/replica_2';


select * from system.cluster;
