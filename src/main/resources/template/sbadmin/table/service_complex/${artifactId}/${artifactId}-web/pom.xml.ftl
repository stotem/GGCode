<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion}</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${artifactId}-web</artifactId>
    <packaging>war</packaging>

    <name>${artifactId}-web Maven Webapp</name>
    <url>${mvnURL}</url>

    <properties>
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
    <#if support_Shiro == "true">
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-web</artifactId>
        </dependency>
        <!-- shiro-spring -->
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-spring</artifactId>
        </dependency>
        <!-- shiro-ehcache -->
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-ehcache</artifactId>
        </dependency>
    </#if>
    </dependencies>

    <build>
        <finalName>${artifactId}-web</finalName>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <path><#noparse>${project.web.basePath}</#noparse></path>
                    <port>8080</port>
                    <uriEncoding>UTF-8</uriEncoding>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
