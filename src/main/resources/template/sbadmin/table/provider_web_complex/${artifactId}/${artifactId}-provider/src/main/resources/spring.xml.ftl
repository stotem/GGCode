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
        http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache-3.2.xsd"
       default-lazy-init="true">

	<context:component-scan base-package="${groupId}.${artifactId}">
		<context:exclude-filter type="annotation" expression="org.springframework.stereotype.Controller" />
	</context:component-scan>
	<!-- 启用缓存注解功能，这个是必须的，否则注解不会生效，另外，该注解一定要声明在spring主配置文件中才会生效 -->
    <cache:annotation-driven cache-manager="cacheManager" key-generator="cacheKeyGenerator"/>

	<bean id="processTimeAspect" class="${groupId}.${artifactId}.common.aspect.ProcessTimeAspect" />
    <aop:aspectj-autoproxy/>
	<aop:config>
		<aop:aspect ref="processTimeAspect">
			<aop:around method="loggerProcessTime" pointcut="within(${groupId}.${artifactId}.provider..*)" />
		</aop:aspect>
	</aop:config>

	<bean id="configure" class="org.springframework.context.support.PropertySourcesPlaceholderConfigurer">
		<property name="locations">
			<list>
				<value>classpath:module-config.properties</value>
			</list>
		</property>
		<property name="ignoreUnresolvablePlaceholders" value="true" />
	</bean>

	<import resource="classpath*:spring-*.xml" />
</beans>
