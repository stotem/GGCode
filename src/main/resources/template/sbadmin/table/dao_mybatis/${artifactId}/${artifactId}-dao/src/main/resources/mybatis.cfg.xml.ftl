<#include "/basic/macro.include"/>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<settings>
		<setting name="cacheEnabled" value="true" />
		<setting name="lazyLoadingEnabled" value="true" />
		<setting name="aggressiveLazyLoading" value="false"/>
		<setting name="multipleResultSetsEnabled" value="true" />
		<setting name="useColumnLabel" value="true" />
		<setting name="useGeneratedKeys" value="false" />
		<setting name="defaultExecutorType" value="SIMPLE" />
	</settings>

	<typeAliases />

	<typeHandlers>
		<typeHandler handler="${groupId}.${artifactId}.dao.typehandler.DelFlagTypeHandler" javaType="${groupId}.${artifactId}.domain.enums.DelFlag" />
	</typeHandlers>

	<mappers />
</configuration>