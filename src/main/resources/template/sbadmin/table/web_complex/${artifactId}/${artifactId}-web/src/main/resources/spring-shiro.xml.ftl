<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:cache="http://www.springframework.org/schema/cache"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache-3.2.xsd"
       default-lazy-init="true">
    <!-- 保证实现了Shiro内部lifecycle函数的bean执行 -->
    <bean id="lifecycleBeanPostProcessor" class="org.apache.shiro.spring.LifecycleBeanPostProcessor"/>

    <bean id="securityManager" class="org.apache.shiro.web.mgt.DefaultWebSecurityManager">
        <property name="realm" ref="textRealm" />
        <property name="cacheManager">
           <bean class="org.apache.shiro.cache.ehcache.EhCacheManager" />
        </property>
        <property name="sessionManager">
           <bean class="org.apache.shiro.web.session.mgt.DefaultWebSessionManager">
               <property name="sessionIdCookie">
                   <bean class="org.apache.shiro.web.servlet.SimpleCookie">
                       <constructor-arg value="SESSIONID"/>
                       <property name="httpOnly" value="true"/>
                       <property name="maxAge" value="-1"/>
                   </bean>
               </property>
           </bean>
        </property>
    </bean>

    <bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
        <property name="staticMethod" value="org.apache.shiro.SecurityUtils.setSecurityManager" />
        <property name="arguments">
            <list>
                <ref bean="securityManager"/>
            </list>
        </property>
    </bean>

    <bean id="textRealm" class="org.apache.shiro.realm.text.TextConfigurationRealm" >
        <property name="userDefinitions">
            <value>
                view=123,view
                admin=123,admin
            </value>
        </property>
        <property name="roleDefinitions">
            <value>
                view=${artifactId}:*:view
                admin=${artifactId}
            </value>
        </property>
    </bean>

    <!-- shiroFilter -->
    <bean id="shiroFilterFactoryBean" class="org.apache.shiro.spring.web.ShiroFilterFactoryBean">
        <!-- Shiro的核心安全接口,这个属性是必须的 -->
        <property name="securityManager" ref="securityManager" />
        <!-- 要求登录时的链接,非必须的属性,默认会自动寻找Web工程根目录下的"/login.jsp"页面 -->
        <property name="loginUrl" value="/views/login" />
        <!-- 登录成功后要跳转的连接 -->
        <property name="successUrl" value="/views/index" />
        <!-- 用户访问未对其授权的资源时,所显示的连接 -->
        <property name="unauthorizedUrl" value="/views/common/unauthorized" />
        <property name="filters">
            <map>
                <entry key="logout">
                    <bean class="org.apache.shiro.web.filter.authc.LogoutFilter">
                        <property name="redirectUrl" value="/views/login"/>
                    </bean>
                </entry>
            </map>
        </property>
        <!-- Shiro过滤链的定义 -->
        <!--此处可配合这篇文章来理解各个过滤连的作用http://blog.csdn.net/jadyer/article/details/12172839 -->
        <!--下面value值的第一个'/'代表的路径是相对于HttpServletRequest.getContextPath()的值来的 -->
        <!--anon：它对应的过滤器里面是空的,什么都没做,这里.do和.jsp后面的*表示参数,比方说login.jsp?main这种 -->
        <!--authc：该过滤器下的页面必须验证后才能访问,它是Shiro内置的一个拦截器org.apache.shiro.web.filter.authc.FormAuthenticationFilter-->
        <property name="filterChainDefinitions">
            <value>
                /css/** = anon
                /js/** = anon
                /font-awesome-4.1.0/** = anon
                /captcha-image = anon
                /login = authc
                /logout = logout
                /** = authc
            </value>
        </property>
    </bean>

</beans>