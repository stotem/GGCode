/*
 * @(#) common-tools RollbackException.java Jun 1, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: RollbackException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime Jun 1, 2014 6:13:06 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class RollbackException extends ServiceException {

    /**
     * create RollbackException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:13:17 PM
     */
    public RollbackException() {
        this("操作异常,数据已回滚");
    }

    /**
     * create RollbackException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:13:17 PM
     * @param message
     * @param cause
     */
    public RollbackException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create RollbackException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:13:17 PM
     * @param message
     */
    public RollbackException(String message) {
        super(message);
    }

    /**
     * create RollbackException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:13:17 PM
     * @param cause
     */
    public RollbackException(Throwable cause) {
        super(cause);
    }

}
