# database pool config
config.dbpool.idleConnectionTestPeriodInMinutes=1
config.dbpool.idleMaxAgeInMinutes=4
config.dbpool.partitionCount=2
config.dbpool.maxConnectionsPerPartition=30
config.dbpool.minConnectionsPerPartition=2
config.dbpool.connectionTimeoutInMs=60000
config.dbpool.acquireIncrement=2
config.dbpool.statementsCacheSize=50
<#if database_split_read == "true">
# readonly database pool config
config.dbpool.read.idleConnectionTestPeriodInMinutes=1
config.dbpool.read.idleMaxAgeInMinutes=4
config.dbpool.read.partitionCount=2
config.dbpool.read.maxConnectionsPerPartition=10
config.dbpool.read.connectionTimeoutInMs=60000
config.dbpool.read.minConnectionsPerPartition=2
config.dbpool.read.acquireIncrement=1
config.dbpool.read.statementsCacheSize=10
</#if>