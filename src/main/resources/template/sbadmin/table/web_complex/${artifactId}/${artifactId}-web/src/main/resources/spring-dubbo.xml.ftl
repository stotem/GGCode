<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.2.xsd
       http://code.alibabatech.com/schema/dubbo http://code.alibabatech.com/schema/dubbo/dubbo.xsd"
       default-lazy-init="true">
    <dubbo:application name="${artifactId}-customer"/>
    <dubbo:annotation/>
    <dubbo:registry address="<#noparse>${config.dubbo.registry.address}</#noparse>" check="false"/>
    <dubbo:protocol name="dubbo" port="<#noparse>${config.local.dubbo.port}</#noparse>" />
</beans>
