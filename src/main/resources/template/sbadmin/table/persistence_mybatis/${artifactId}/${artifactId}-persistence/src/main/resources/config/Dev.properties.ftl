<#if support_Redis == "true">
# redis config
config.redis.hosts=127.0.0.1:6379,127.0.0.1:6379
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
<#if database_split_read == "true">
# readonly database config
config.dbpool.read.jdbcUrl=${jdbc_url?replace('&', '&amp;')}
config.dbpool.read.username=${jdbc_username}
config.dbpool.read.password=${jdbc_password}
</#if>