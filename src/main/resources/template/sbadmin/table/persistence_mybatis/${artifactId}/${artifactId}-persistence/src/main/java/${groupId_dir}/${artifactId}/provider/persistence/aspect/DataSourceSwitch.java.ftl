package ${groupId}.${artifactId}.provider.persistence.aspect;

import ${groupId}.${artifactId}.provider.persistence.datasource.DynamicRouteDataSource;

public interface DataSourceSwitch {

    DynamicRouteDataSource.DataSourceType getSwitchTarget(String targetName);
}