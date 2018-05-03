<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:util="http://www.springframework.org/schema/util" xmlns:context="http://www.springframework.org/schema/context"
       xmlns:tx="http://www.springframework.org/schema/tx" xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:cache="http://www.springframework.org/schema/cache" xmlns:p="http://www.springframework.org/schema/p"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
        http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd
        http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util.xsd
		http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache-3.2.xsd">

    <!-- dummy cacheManager  -->
    <bean id="cacheManager" class="org.springframework.cache.support.CompositeCacheManager">
        <property name="cacheManagers">
            <list>
                <ref bean="simpleCacheManager" />
            </list>
        </property>
        <property name="fallbackToNoOpCache" value="true" />
    </bean>
    <bean id="simpleCacheManager" class="org.springframework.cache.support.SimpleCacheManager">
        <property name="caches">
            <set>
                <#if cache_ForRedis == "true" && support_Redis == "true">
                <!--1天缓存-->
                <bean class="org.springframework.data.redis.cache.RedisCache">
                    <constructor-arg index="0" value="oneDay"/>
                    <constructor-arg index="1" value=""/>
                    <constructor-arg index="2" ref="cache.template"/>
                    <!--过期时间:秒-->
                    <constructor-arg index="3" value="86400"/>
                </bean>
                <!--5分钟缓存-->
                <bean class="org.springframework.data.redis.cache.RedisCache">
                    <constructor-arg index="0" value="fiveMinutes"/>
                    <constructor-arg index="1" value=""/>
                    <constructor-arg index="2" ref="cache.template"/>
                    <!--过期时间:秒-->
                    <constructor-arg index="3" value="300"/>
                </bean>
                <!--1分钟缓存-->
                <bean class="org.springframework.data.redis.cache.RedisCache">
                    <constructor-arg index="0" value="oneMinutes"/>
                    <constructor-arg index="1" value=""/>
                    <constructor-arg index="2" ref="cache.template"/>
                    <!--过期时间:秒-->
                    <constructor-arg index="3" value="60"/>
                </bean>
                <!--5秒缓存-->
                <bean class="org.springframework.data.redis.cache.RedisCache">
                    <constructor-arg index="0" value="transient"/>
                    <constructor-arg index="1" value=""/>
                    <constructor-arg index="2" ref="cache.template"/>
                    <!--过期时间:秒-->
                    <constructor-arg index="3" value="5"/>
                </bean>
                </#if>
                <!--基于 java.util.concurrent.ConcurrentHashMap 的一个内存缓存实现方案-->
                <bean class="org.springframework.cache.concurrent.ConcurrentMapCache">
                    <constructor-arg index="0" value="default"/>
                </bean>
            </set>
        </property>
    </bean>
    <bean id="cacheKeyGenerator" class="${base_pkg}.provider.persistence.utils.CacheKeyGenerator">
        <property name="prefix" value="<#noparse>${config.cache.key.prefix}</#noparse>"/>
    </bean>
    <#if support_Redis == "true">
    <bean id="stringRedisSerializer" class="${base_pkg}.provider.persistence.utils.StringRedisSerializer">
        <property name="prefix" value="<#noparse>${config.cache.key.prefix}</#noparse>"/>
    </bean>
    <bean id="fastjsonRedisSerializer" class="${base_pkg}.provider.persistence.utils.FastJson2JsonRedisSerializer" />

	<bean id="redis.poolConfig" class="redis.clients.jedis.JedisPoolConfig">
		<!-- <property name="maxActive" value="1000" /> -->
		<property name="maxIdle" value="500" />
		<!-- <property name="maxWait" value="1000" /> -->
		<property name="testOnBorrow" value="true" />
	</bean>

    <bean id="redis.sentinelConfig" class="org.springframework.data.redis.connection.RedisSentinelConfiguration">
        <constructor-arg index="0" value="<#noparse>${config.redis.mastername}</#noparse>" />
        <constructor-arg index="1">
            <set>
                <value><#noparse>${config.redis.host1}</#noparse></value>
                <value><#noparse>${config.redis.host2}</#noparse></value>
                <value><#noparse>${config.redis.host3}</#noparse></value>
            </set>
        </constructor-arg>
    </bean>

	<bean id="cache.connectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory">
        <constructor-arg index="0" ref="redis.sentinelConfig"/>
        <constructor-arg index="1" ref="redis.poolConfig" />
        <property name="usePool" value="true" />
	</bean>
	<bean id="cache.template" class="org.springframework.data.redis.core.RedisTemplate">
        <property name="connectionFactory" ref="cache.connectionFactory" />
        <property name="keySerializer" ref="stringRedisSerializer" />
        <property name="hashKeySerializer" ref="stringRedisSerializer" />
        <property name="valueSerializer" ref="fastjsonRedisSerializer" />
		<property name="hashValueSerializer" ref="fastjsonRedisSerializer" />
	</bean>
    </#if>
</beans>
