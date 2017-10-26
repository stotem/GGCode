<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.2.xsd
       http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd">
    <dubbo:application name="${artifactId}-customer" logger="slf4j"/>
    <dubbo:annotation/>
    <dubbo:registry address="<#noparse>${config.dubbo.registry.address}</#noparse>" timeout="20000" check="false"/>
    <!-- config remote service in here -->
    <!-- example:
         <dubbo:reference interface="com.wujianjun.service.DictionaryService" version="1.0" group="default" id="dictionaryService" />
    -->
</beans>
