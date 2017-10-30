package ${groupId}.${artifactId}.common.aspect;

import ${groupId}.${artifactId}.common.datasource.DataSource;
import ${groupId}.${artifactId}.common.datasource.DynamicRouteDataSource;
import ${groupId}.${artifactId}.common.objects.ThreadContext;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Method;

<#include "/basic/author.include"/>
public final class DataSourceAspect {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public void setDataSourceType(org.aspectj.lang.JoinPoint joinPoint) throws Throwable {
        final MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
        final Method method = joinPoint.getTarget().getClass().getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
        DataSource dataSourceAnnotation = method.getAnnotation(DataSource.class);
        if (dataSourceAnnotation == null) {
            return;
        }
        ThreadContext.put(DynamicRouteDataSource.THREAD_CONTEXT_DATA_SOURCE_KEY, dataSourceAnnotation.value().getTypeName());
    }
}