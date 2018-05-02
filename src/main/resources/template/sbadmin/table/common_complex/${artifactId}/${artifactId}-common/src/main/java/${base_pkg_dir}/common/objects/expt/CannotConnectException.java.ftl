/*
 * @(#) common-tools CannotConnectException.java May 29, 2014
 * 
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: CannotConnectException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2014 11:23:58 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class CannotConnectException extends RollbackException {

    /**
     * create CannotConnectException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:24:08 PM
     */
    public CannotConnectException() {
        this("不能建立远端连接");
    }

    /**
     * create CannotConnectException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:24:08 PM
     * @param message
     * @param cause
     */
    public CannotConnectException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create CannotConnectException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:24:08 PM
     * @param message
     */
    public CannotConnectException(String message) {
        super(message);
    }

    /**
     * create CannotConnectException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:24:08 PM
     * @param cause
     */
    public CannotConnectException(Throwable cause) {
        super(cause);
    }

}
