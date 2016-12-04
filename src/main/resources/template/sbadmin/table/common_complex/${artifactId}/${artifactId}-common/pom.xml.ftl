<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>${artifactId}</artifactId>
        <groupId>${groupId}</groupId>
        <version>${mvnVersion?default('1.0-SNAPSHOT')}</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>${artifactId}-common</artifactId>
    <packaging>jar</packaging>

    <name>${artifactId}-common</name>

    <properties>
    </properties>

    <dependencies>
        <dependency>
            <groupId>javax.validation</groupId>
            <artifactId>validation-api</artifactId>
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
    </dependencies>
</project>
