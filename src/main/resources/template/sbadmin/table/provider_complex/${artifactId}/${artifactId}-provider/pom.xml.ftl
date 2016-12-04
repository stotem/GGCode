<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <#if export_provider_service == "true">
    <artifactId>${artifactId}-provider</artifactId>
    <groupId>${groupId}</groupId>
    <version>${mvnVersion?default('1.0-SNAPSHOT')}</version>
    <packaging>war</packaging>
    <#else>
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion?default('1.0-SNAPSHOT')}</version>
    </parent>
    <packaging>jar</packaging>
    <artifactId>${artifactId}-provider</artifactId>
    </#if>
    <modelVersion>4.0.0</modelVersion>
    <name>${artifactId}-provider</name>

    <properties />

    <dependencies>
        <dependency>
            <artifactId>${artifactId}-service</artifactId>
            <groupId>${groupId}</groupId>
            <#if export_provider_service == "true">
            <version><#noparse>${project.version}</#noparse></version>
            <#else>
            <version><#noparse>${project.parent.version}</#noparse></version>
            </#if>
        </dependency>
        <dependency>
            <artifactId>${artifactId}-common</artifactId>
            <groupId>${groupId}</groupId>
            <#if export_provider_service == "true">
            <version><#noparse>${project.version}</#noparse></version>
            <#else>
            <version><#noparse>${project.parent.version}</#noparse></version>
            </#if>
        </dependency>
        <dependency>
            <artifactId>${artifactId}-domain</artifactId>
            <groupId>${groupId}</groupId>
            <#if export_provider_service == "true">
            <version><#noparse>${project.version}</#noparse></version>
            <#else>
            <version><#noparse>${project.parent.version}</#noparse></version>
            </#if>
        </dependency>
        <!-- drivers & middle ware -->
        <dependency>
            <groupId>com.jolbox</groupId>
            <artifactId>bonecp-spring</artifactId>
        </dependency>
        <dependency>
            <groupId>com.jolbox</groupId>
            <artifactId>bonecp-provider</artifactId>
        </dependency>
        <dependency>
            <groupId>com.jolbox</groupId>
            <artifactId>bonecp</artifactId>
        </dependency>
        <dependency>
            <groupId>org.mariadb.jdbc</groupId>
            <artifactId>mariadb-java-client</artifactId>
        </dependency>
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
        </dependency>
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
        </dependency>
    <#if support_Dubbo == "true">
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>dubbo</artifactId>
        </dependency>
    </#if>
    </dependencies>
    <build>
        <finalName>${artifactId}-provider</finalName>
        <filters>
            <filter>src/main/resources/config/<#noparse>${profile-name}.properties</#noparse></filter>
        </filters>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>true</filtering>
            </resource>
        </resources>
        <#if export_provider_service == "true">
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
            </plugin>
        </plugins>
        </#if>
    </build>
</project>
