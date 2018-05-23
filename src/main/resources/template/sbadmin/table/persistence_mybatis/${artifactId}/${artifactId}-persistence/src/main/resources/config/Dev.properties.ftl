<#if support_Redis == "true">
# redis config
config.redis.host1=
config.redis.host2=
config.redis.host3=
config.redis.mastername=mymaster
</#if>
<#if support_mongoDB == "true">
# mongoDB config
config.mongo.hosts=
config.mongo.dbname=
</#if>
# database config
config.dbpool.driverClass=${jdbc_driver}
config.dbpool.jdbcUrl=${jdbc_url?replace('&', '&amp;')}
config.dbpool.username=${jdbc_username}
config.dbpool.password=${jdbc_password}
config.dbpool.idleConnectionTestPeriodInMinutes=1
config.dbpool.idleMaxAgeInMinutes=4
config.dbpool.partitionCount=2
config.dbpool.maxConnectionsPerPartition=30
config.dbpool.minConnectionsPerPartition=2
config.dbpool.connectionTimeoutInMs=5000
config.dbpool.maxConnectionAge=0
config.dbpool.acquireIncrement=2
config.dbpool.statementsCacheSize=50
<#if database_split_read == "true">
# readonly database config
config.dbpool.read.jdbcUrl=${jdbc_url?replace('&', '&amp;')}
config.dbpool.read.username=${jdbc_username}
config.dbpool.read.password=${jdbc_password}
config.dbpool.read.idleConnectionTestPeriodInMinutes=1
config.dbpool.read.idleMaxAgeInMinutes=4
config.dbpool.read.partitionCount=2
config.dbpool.read.maxConnectionsPerPartition=10
config.dbpool.read.minConnectionsPerPartition=2
config.dbpool.read.connectionTimeoutInMs=5000
config.dbpool.read.maxConnectionAge=0
config.dbpool.read.acquireIncrement=1
config.dbpool.read.statementsCacheSize=10
</#if>