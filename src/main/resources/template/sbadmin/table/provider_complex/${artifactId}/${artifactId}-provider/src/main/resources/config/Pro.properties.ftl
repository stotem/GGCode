<#if support_Redis == "true">
config.redis.host1=
config.redis.host2=
config.redis.host3=
</#if>
<#if support_mongoDB == "true">
config.mongo.hosts=
config.mongo.dbname=
</#if>
config.dbpool.driverClass=${jdbc_driver}
config.dbpool.jdbcUrl=${jdbc_url?replace('&', '&amp;')}
config.dbpool.username=${jdbc_username}
config.dbpool.password=${jdbc_password}
config.dbpool.idleConnectionTestPeriodInMinutes=1
config.dbpool.idleMaxAgeInMinutes=4
config.dbpool.partitionCount=2
config.dbpool.maxConnectionsPerPartition=30
config.dbpool.minConnectionsPerPartition=2
config.dbpool.acquireIncrement=2
config.dbpool.statementsCacheSize=50

config.dbpool.read.jdbcUrl=${jdbc_url?replace('&', '&amp;')}
config.dbpool.read.username=${jdbc_username}
config.dbpool.read.password=${jdbc_password}
config.dbpool.read.idleConnectionTestPeriodInMinutes=1
config.dbpool.read.idleMaxAgeInMinutes=4
config.dbpool.read.partitionCount=2
config.dbpool.read.maxConnectionsPerPartition=10
config.dbpool.read.minConnectionsPerPartition=2
config.dbpool.read.acquireIncrement=1
config.dbpool.read.statementsCacheSize=10
<#if support_Dubbo == "true">
config.dubbo.registry.address=
config.dubbo.local.port=20881
</#if>
