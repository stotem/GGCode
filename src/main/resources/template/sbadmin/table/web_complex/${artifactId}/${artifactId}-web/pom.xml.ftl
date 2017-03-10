<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion?default('1.0-SNAPSHOT')}</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${artifactId}-web</artifactId>
    <packaging>war</packaging>

    <name>${artifactId}-web Maven Webapp</name>

    <properties>
        <project.web.basePath>${contentPath?default('/')}</project.web.basePath>
    </properties>

    <dependencies>
        <dependency>
            <artifactId>${artifactId}-service</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
        <dependency>
            <artifactId>${artifactId}-common</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
        <dependency>
            <artifactId>${artifactId}-domain</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
        <dependency>
        	<groupId>org.javassist</groupId>
        	<artifactId>javassist</artifactId>
        	<version>3.19.0-GA</version>
        </dependency>
        <dependency>
            <groupId>com.github.axet</groupId>
            <artifactId>kaptcha</artifactId>
            <version>0.0.9</version>
        </dependency>
        <dependency>
            <groupId>commons-fileupload</groupId>
            <artifactId>commons-fileupload</artifactId>
        </dependency>
        <!-- url rewrite -->
        <dependency>
            <groupId>org.tuckey</groupId>
            <artifactId>urlrewritefilter</artifactId>
        </dependency>
        <!-- Validator -->
        <dependency>
            <groupId>javax.validation</groupId>
            <artifactId>validation-api</artifactId>
        </dependency>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-validator</artifactId>
        </dependency>
        <!-- container -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
        </dependency>
        <dependency>
            <groupId>javax.el</groupId>
            <artifactId>javax.el-api</artifactId>
        </dependency>
    <#if spring_viewresolver?lower_case?trim == 'velocity'>
        <dependency>
            <groupId>org.apache.velocity</groupId>
            <artifactId>velocity</artifactId>
        </dependency>
        <dependency>
            <groupId>velocity</groupId>
            <artifactId>velocity-dep</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.velocity</groupId>
            <artifactId>velocity-tools</artifactId>
        </dependency>
    </#if>
    <#if support_Shiro == "true">
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-web</artifactId>
        </dependency>
    </#if>
    <#if support_Dubbo == "true">
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>dubbo</artifactId>
        </dependency>
    </#if>
    <#if export_provider_service != "true">
        <dependency>
            <artifactId>${artifactId}-provider</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
    </#if>
    </dependencies>

    <build>
        <finalName>${artifactId}-web</finalName>
        <filters>
            <filter>src/main/resources/config/<#noparse>${profile-name}.properties</#noparse></filter>
        </filters>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>true</filtering>
            </resource>
        </resources>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
