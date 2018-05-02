/*
 * @(#) common-tools DataNotFoundException.java May 29, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: DataNotFoundException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime May 29, 2014 11:18:01 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class DataNotFoundException extends RollbackException {
    /**
     * create DataNotFoundException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     */
    public DataNotFoundException() {
        this("数据已被删除");
    }

    /**
     * create DataNotFoundException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param message
     * @param cause
     */
    public DataNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create DataNotFoundException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param message
     */
    public DataNotFoundException(String message) {
        super(message);
    }

    /**
     * create DataNotFoundException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param cause
     */
    public DataNotFoundException(Throwable cause) {
        super(cause);
    }

}
