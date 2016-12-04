<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:util="http://www.springframework.org/schema/util" xmlns:context="http://www.springframework.org/schema/context"
       xmlns:tx="http://www.springframework.org/schema/tx" xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
        http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd
        http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util.xsd"
       default-lazy-init="true">

    <bean id="webConfigure" class="org.springframework.context.support.PropertySourcesPlaceholderConfigurer">
        <property name="locations">
            <list>
                <value>classpath:module-config.properties</value>
            </list>
        </property>
        <property name="ignoreUnresolvablePlaceholders" value="true" />
    </bean>

    <context:component-scan base-package="${groupId}.${artifactId}" use-default-filters="false">
        <context:include-filter type="annotation" expression="org.springframework.stereotype.Controller" />
    </context:component-scan>

    <mvc:annotation-driven conversion-service="conversionService">
        <mvc:message-converters register-defaults="true">
            <!-- 将StringHttpMessageConverter的默认编码设为UTF-8 -->
            <bean class="org.springframework.http.converter.StringHttpMessageConverter">
                <constructor-arg value="UTF-8"/>
                <property name="supportedMediaTypes">
                   <list>
                       <value>application/xml;charset=UTF-8</value>
                       <value>text/html;charset=UTF-8</value>
                       <value>text/plain;charset=UTF-8</value>
                       <value>application/json;charset=UTF-8</value>
                   </list>
               </property>
            </bean>
            <!-- 将Jackson2HttpMessageConverter的默认格式化输出设为true -->
            <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
                <property name="prettyPrint" value="true"/>
            </bean>
        </mvc:message-converters>
    </mvc:annotation-driven>

    <!-- 配置静态资源 -->
    <mvc:default-servlet-handler />
    <mvc:resources location="/favicon.ico" mapping="/favicon.ico" order="-1"/>
    <mvc:resources location="/WEB-INF/assert/" mapping="/**"/>
    <bean name="/views/**" class="org.springframework.web.servlet.mvc.UrlFilenameViewController" />

    <bean id="conversionService" class="org.springframework.format.support.FormattingConversionServiceFactoryBean">
        <property name="registerDefaultFormatters" value="true" />
        <property name="formatters">
            <set>
                <bean class="${groupId}.${artifactId}.common.formatter.TimestampFormatter" />
            </set>
        </property>
    </bean>

    <bean class="org.springframework.web.servlet.view.ContentNegotiatingViewResolver">
        <property name="contentNegotiationManager">
            <bean class="org.springframework.web.accept.ContentNegotiationManagerFactoryBean">
                <property name="defaultContentType" value="text/html;charset=UTF-8" />
                <!-- not by accept header -->
                <property name="ignoreAcceptHeader" value="true"/>
                <property name="favorPathExtension" value="true"/>
                <property name="favorParameter" value="true"/>
                <!-- by extension -->
                <property name="mediaTypes">
                    <map>
                        <entry key="xml" value="application/xml" />
                        <entry key="json" value="application/json" />
                    </map>
                </property>
            </bean>
        </property>
		<property name="viewResolvers">
			<list>
                <ref bean="viewResolver"/>
			</list>
		</property>
  		<property name="defaultViews">
			<list>
                <bean class="org.springframework.web.servlet.view.json.MappingJackson2JsonView" />
               	<bean class="org.springframework.web.servlet.view.xml.MappingJackson2XmlView" />
			</list>
		</property>
	</bean>

	<util:map id="viewTools">
        <#if support_Shiro == "true">
        <entry key="shiro">
            <bean class="${groupId}.${artifactId}.web.utils.ShiroUtils"/>
        </entry>
        </#if>
        <entry key="basePath" value="<#noparse>${app.basePath}</#noparse>" />
        <entry key="tools">
            <bean class="${groupId}.${artifactId}.common.tools.Tools" />
        </entry>
        <entry key="Long">
            <bean class="java.lang.Long" >
                <constructor-arg index="0" value="0"/>
            </bean>
        </entry>
    </util:map>

<#if support_Shiro == "true">
    <!-- 开启Shiro的注解，实现对Controller的方法级权限检查(如@RequiresRoles,@RequiresPermissions) -->
    <bean class="org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator" depends-on="lifecycleBeanPostProcessor" >
        <property name="proxyTargetClass" value="true" />
    </bean>
    <bean class="org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor">
        <property name="securityManager" ref="securityManager" />
    </bean>
</#if>

    <bean class="${groupId}.${artifactId}.common.resolver.ExceptionMappingResolver">
        <property name="defaultErrorView" value="/common/error" />
        <property name="exceptionMappings">
            <props>
                <prop key="${groupId}.${artifactId}.common.objects.expt.ServiceException">/common/error</prop>
            <#if support_Shiro == "true">
                <prop key="org.apache.shiro.authz.UnauthorizedException">/common/unauthorized</prop>
            </#if>
            </props>
        </property>
    </bean>
<#if spring_viewresolver == "jsp">
    <bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="contentType" value="text/html;charset=UTF-8" />
        <property name="attributesMap" ref="viewTools"/>
        <property name="prefix" value="/WEB-INF/views/" />
        <property name="suffix" value=".jsp" />
    </bean>
<#else>
    <!-- 视图解析器配置 - velocity视图解析-->
    <bean id="viewResolver" class="org.springframework.web.servlet.view.velocity.VelocityLayoutViewResolver">
        <property name="layoutUrl" value="layouts/default.view" />
        <property name="cache" value="false" />
        <property name="suffix" value=".view" />
        <property name="exposeSpringMacroHelpers" value="true" />
        <property name="contentType" value="text/html;charset=UTF-8" />
        <property name="attributesMap" ref="viewTools"/>
    </bean>
    <bean id="velocityConfig" class="org.springframework.web.servlet.view.velocity.VelocityConfigurer">
        <property name="resourceLoaderPath" value="/WEB-INF/views/" />
        <property name="velocityProperties">
            <props>
                <prop key="input.encoding">UTF-8</prop>
                <prop key="output.encoding">UTF-8</prop>
                <prop key="contentType">text/html;charset=UTF-8</prop>
                <prop key="velocimacro.library">common/base.macro</prop>
                <prop key="file.resource.loader.cache">false</prop>
                <prop key="file.resource.loader.modificationCheckInterval">1</prop>
                <prop key="velocimacro.library.autoreload">true</prop>
                <prop key="eventhandler.referenceinsertion.class">org.apache.velocity.app.event.implement.EscapeHtmlReference</prop>
                <prop key="eventhandler.escape.html.match">/^(?:screen_content)|(?:noescape_.*)$/</prop>
            </props>
        </property>
    </bean>
</#if>

    <!-- 文件上传 -->
    <bean id="multipartResolver"
          class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <property name="defaultEncoding" value="UTF-8"/>
    </bean>

    <bean id="localeResolver" class="org.springframework.web.servlet.i18n.CookieLocaleResolver">
        <property name="cookieName" value="language"/>
        <!--单位:秒, -1表示这个Cookie在浏览器关闭之后就失效-->
        <property name="cookieMaxAge" value="-1"/>
        <property name="defaultLocale" value="zh_CN"/>
    </bean>

    <!-- 验证码图片配置 -->
    <bean id="captchaProducer" class="com.google.code.kaptcha.impl.DefaultKaptcha">
        <property name="config">
            <bean class="com.google.code.kaptcha.util.Config">
                <constructor-arg>
                    <props>
                        <prop key="kaptcha.image.width">65</prop>
                        <prop key="kaptcha.image.height">30</prop>
                        <prop key="kaptcha.textproducer.font.size">25</prop>
                        <prop key="kaptcha.textproducer.font.color">red</prop>
                        <prop key="kaptcha.textproducer.font.names">Arial</prop>
                        <prop key="kaptcha.textproducer.char.string">abcde2345678gfynmnpwx</prop>
                        <prop key="kaptcha.textproducer.char.length">4</prop>
                        <prop key="kaptcha.obscurificator.impl">com.google.code.kaptcha.impl.ShadowGimpy</prop>
                        <prop key="kaptcha.noise.impl">com.google.code.kaptcha.impl.DefaultNoise</prop>
                    </props>
                </constructor-arg>
            </bean>
        </property>
    </bean>

    <mvc:interceptors>
        <mvc:interceptor>
            <mvc:mapping path="/**/*"/>
            <bean class="${groupId}.${artifactId}.common.interceptor.ThreadContextInterceptor" />
        </mvc:interceptor>
    </mvc:interceptors>

</beans>
