package ${base_pkg}.common.annotation;

import java.lang.annotation.*;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: 日志记录方法执行时间注解类 </B><BR/>
 * <B>Copyright:Copyright(c)2018 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2018 10:38:15 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface LoggerProcessTime {
    long error() default 5000L;
    long warn() default 3000L;
    long info() default 1000L;
}
