<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion?default('1.0-SNAPSHOT')}</version>
    </parent>
    <artifactId>service-provider</artifactId>
    <#if export_provider_service == "true">
    <packaging>war</packaging>
    <#else>
    <packaging>jar</packaging>
    </#if>
    <modelVersion>4.0.0</modelVersion>
    <name>service-provider</name>

    <properties />

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
            <artifactId>${artifactId}-persistence</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
        <dependency>
            <artifactId>${artifactId}-domain</artifactId>
            <groupId>${groupId}</groupId>
            <version><#noparse>${project.parent.version}</#noparse></version>
        </dependency>
    <#if support_Dubbo == "true">
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>dubbo</artifactId>
        </dependency>
        <dependency>
            <groupId>com.101tec</groupId>
            <artifactId>zkclient</artifactId>
        </dependency>
    </#if>
    </dependencies>
    <build>
        <finalName>service-provider</finalName>
        <#if export_provider_service == "true">
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
            <plugin>
                <groupId>org.eclipse.jetty</groupId>
                <artifactId>jetty-maven-plugin</artifactId>
                <configuration>
                    <stopPort>9081</stopPort>
                    <httpConnector>
                        <port>8081</port>
                    </httpConnector>
                </configuration>
            </plugin>
        </plugins>
        </#if>
    </build>
</project>
