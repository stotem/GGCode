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
config.dbpool.partitionCount=1
config.dbpool.maxConnectionsPerPartition=30
config.dbpool.minConnectionsPerPartition=2
config.dbpool.acquireIncrement=2
config.dbpool.statementsCacheSize=50
config.dbpool.releaseHelperThreads=3
<#if support_Dubbo == "true">
config.dubbo.registry.address=
config.dubbo.local.port=20881
</#if>
