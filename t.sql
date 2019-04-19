-- host 1

-- drop
use timeline_shard_1;
drop table `timeline`;
use timeline_shard_3;
drop table `timeline`;

-- create
create database IF NOT EXISTS timeline_shard_1;
use timeline_shard_1;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard1/replica', 'replica_1') ORDER BY fullname SETTINGS index_granularity = 8192;
create database IF NOT EXISTS timeline_shard_3;
use timeline_shard_3;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard3/replica', 'replica_2')  ORDER BY fullname SETTINGS index_granularity = 8192;



-- delete
alert table  timeline_shard_1.timeline delete where  1=1;
alert table  timeline_shard_3.timeline delete where  1=1;

-- 校验
use timeline_shard_1;
desc timeline;
select * from timeline;
use timeline_shard_3;
desc timeline;
select * from timeline;




-- host 2

-- drop
use timeline_shard_2;
drop table `timeline`;
use timeline_shard_1;
drop table `timeline`;


-- create
create database IF NOT EXISTS timeline_shard_2;
use timeline_shard_2;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard2/replica', 'replica_1') ORDER BY fullname SETTINGS index_granularity = 8192;
create database IF NOT EXISTS timeline_shard_1;
use timeline_shard_1;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard1/replica', 'replica_2') ORDER BY fullname SETTINGS index_granularity = 8192;



-- 校验
use timeline_shard_2;
desc timeline;
select * from timeline;
use timeline_shard_1;
desc timeline;
select * from timeline;





-- host 3


-- drop
use timeline_shard_3;
drop table `timeline`;
use timeline_shard_2;
drop table `timeline`;

-- create
create database IF NOT EXISTS timeline_shard_3;
use timeline_shard_3;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard3/replica', 'replica_1') ORDER BY fullname SETTINGS index_granularity = 8192;
create database IF NOT EXISTS timeline_shard_2;
use timeline_shard_2;
create table timeline ( fullname String,  position String, end      String, over     String ) ENGINE = ReplicatedMergeTree('/clickhouse/cluster_timeline_shard2/replica', 'replica_2') ORDER BY fullname SETTINGS index_granularity = 8192;



-- 校验
use timeline_shard_3;
desc timeline;
select * from timeline;
use timeline_shard_2;
desc timeline;
select * from timeline;

-- cluster
use default;
create table cluster_timeline ( fullname String,  position String, end      String, over     String ) ENGINE = Distributed( 'timeline_3shards_2replicas', '',timeline, rand());
select * from cluster_timeline;

-- insert test
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182030', '22473', '0', 'true');
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182031', '22473', '0', 'true');
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182032', '22473', '0', 'true');
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182033', '22473', '0', 'true');
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182034', '22473', '0', 'true');
INSERT INTO default.cluster_timeline (fullname, position, end, over) VALUES ('/Users/liyunlong/git/suixingpay/treceiver-etl/data/trandata.log.201904182035', '22473', '0', 'true');



SELECT * FROM system.zookeeper WHERE path = '/clickhouse/cluster_timeline_shard2/replica/replicas/replica_2';


alter table system.zookeeper delete WHERE path = '/clickhouse/cluster_timeline_shard2/replica/replicas/replica_2';


select * from system.cluster;
