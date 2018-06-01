package ${base_pkg}.provider.persistence.datasource;

import java.lang.annotation.*;

/**
 * <B>Description: 读写分离注解标识类 </B><BR/>
 * <B>Copyright:Copyright(c)2018 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2018 11:38:15 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface DataSource {
    DynamicRouteDataSource.DataSourceType value() default DynamicRouteDataSource.DataSourceType.READ_DATA_SOURCE;
}