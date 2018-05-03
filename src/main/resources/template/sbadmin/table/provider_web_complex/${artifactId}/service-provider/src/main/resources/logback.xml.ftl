<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">

    <jmxConfigurator />

	<appender name="FILEINFO" class="ch.qos.logback.core.rolling.RollingFileAppender">
		<file><#noparse>${catalina.base}</#noparse>/logs/${artifactId}-pro_warn.log</file>
		<rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
			<FileNamePattern><#noparse>${catalina.base}</#noparse>/logs/%d{yyyy-MM-dd}/${artifactId}-pro_warn.log</FileNamePattern>
		</rollingPolicy>
		<filter class="ch.qos.logback.classic.filter.LevelFilter">
			<level>WARN</level>
			<onMatch>ACCEPT</onMatch>
			<onMismatch>DENY</onMismatch>
		</filter>
		<encoder>
			<pattern>[${artifactId}-pro] %d{yyyy-MM-dd HH:mm:ss.SSS}:[%-5level][%t]{%logger{0}:%L}-%m%n</pattern>
		</encoder>
	</appender>
	<appender name="FILEERROR" class="ch.qos.logback.core.rolling.RollingFileAppender">
		<file><#noparse>${catalina.base}</#noparse>/logs/${artifactId}-pro_error.log</file>
		<rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
			<FileNamePattern><#noparse>${catalina.base}</#noparse>/logs/%d{yyyy-MM-dd}/${artifactId}-pro_error.log</FileNamePattern>
		</rollingPolicy>
		<filter class="ch.qos.logback.classic.filter.LevelFilter">
			<level>ERROR</level>
			<onMatch>ACCEPT</onMatch>
			<onMismatch>DENY</onMismatch>
		</filter>
		<encoder>
			<pattern>[${artifactId}-pro] %d{yyyy-MM-dd HH:mm:ss.SSS}:[%-5level][%t]{%logger{0}:%L}-%m%n</pattern>
		</encoder>
	</appender>
	<appender name="console" class="ch.qos.logback.core.ConsoleAppender">
		<encoder>
			<pattern>[${artifactId}-pro|console] %d{yyyy-MM-dd HH:mm:ss.SSS}:[%-5level][%t]{%logger{0}:%L}-%m%n</pattern>
		</encoder>
	</appender>

	<logger name="net.sf.ehcache" level="WARN" />
	<logger name="org.springframework" level="INFO" />
	<logger name="org.apache.mina" level="WARN" />
	<logger name="org.apache.cxf" level="WARN" />
	<logger name="org.springframework.flex" level="ERROR" />

	<root level="<#noparse>${catalina.log.priority}</#noparse>">
		<appender-ref ref="console" />
	</root>
</configuration> 