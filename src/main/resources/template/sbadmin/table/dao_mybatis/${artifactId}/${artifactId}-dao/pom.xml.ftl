<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion}</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${artifactId}-dao</artifactId>
    <packaging>jar</packaging>

    <name>${artifactId}-dao</name>
    <url>${mvnURL}</url>

    <properties>
    </properties>

    <dependencies>
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
    </dependencies>
</project>
