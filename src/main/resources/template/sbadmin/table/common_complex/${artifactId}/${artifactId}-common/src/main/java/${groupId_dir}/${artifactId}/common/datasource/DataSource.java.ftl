package ${groupId}.${artifactId}.common.datasource;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#include "/basic/author.include"/>
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface DataSource {
    DynamicRouteDataSource.DataSourceType value() default DynamicRouteDataSource.DataSourceType.READ_DATA_SOURCE;
}