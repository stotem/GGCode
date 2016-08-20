<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion}</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${artifactId}-common</artifactId>
    <packaging>jar</packaging>

    <name>${artifactId}-common</name>
    <url>${mvnURL}</url>

    <properties>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
            <version>3.3.2</version>
        </dependency>
    </dependencies>
</project>
