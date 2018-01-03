<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.2.xsd
       http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd">

    <dubbo:consumer timeout="30000" check="false" cluster="failfast" retries="0" init="true" group="default" version="1.0" />
    <dubbo:provider timeout="30000" cluster="failfast" retries="0" group="default" version="1.0" />
    <dubbo:application name="service-provider" logger="slf4j"/>
    <dubbo:annotation/>
    <dubbo:registry address="<#noparse>${config.dubbo.registry.address}</#noparse>" check="false"/>
    <dubbo:protocol name="dubbo" port="<#noparse>${config.dubbo.local.port}</#noparse>" />
    <!-- config remote service in here -->
    <!-- example:
        <dubbo:service interface="com.wujianjun.service.DictionaryService" ref="dictionaryServiceImpl"/>
    -->
</beans>
