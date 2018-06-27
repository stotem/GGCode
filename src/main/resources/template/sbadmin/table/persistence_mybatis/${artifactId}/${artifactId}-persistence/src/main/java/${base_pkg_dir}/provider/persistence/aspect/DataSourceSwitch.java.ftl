package ${base_pkg}.provider.persistence.aspect;

import ${base_pkg}.provider.persistence.datasource.DynamicRouteDataSource;
/**
 * <B>Description: 读写分离开关接口 </B><BR/>
 * <B>Copyright:Copyright(c)2018 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2018 11:38:15 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public interface DataSourceSwitch {

    DynamicRouteDataSource.DataSourceType getSwitchTarget(String targetName);
}