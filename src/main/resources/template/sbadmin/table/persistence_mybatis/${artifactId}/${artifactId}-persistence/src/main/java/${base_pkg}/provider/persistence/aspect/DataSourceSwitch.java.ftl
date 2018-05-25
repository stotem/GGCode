package ${base_pkg}.provider.persistence.aspect;

import ${base_pkg}.provider.persistence.datasource.DynamicRouteDataSource;

public interface DataSourceSwitch {

    DynamicRouteDataSource.DataSourceType getSwitchTarget(String targetName);
}