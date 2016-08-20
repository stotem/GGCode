/*
 * @(#) common-tools ServiceException.java May 29, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: TODO </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime May 29, 2014 11:32:33 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class ServiceException extends Exception {

    /**
     * create ServiceException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:32:43 PM
     */
    public ServiceException() {
        this("业务校验异常");
    }

    /**
     * create ServiceException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:32:43 PM
     * @param message
     * @param cause
     */
    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create ServiceException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:32:43 PM
     * @param message
     */
    public ServiceException(String message) {
        super(message);
    }

    /**
     * create ServiceException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:32:43 PM
     * @param cause
     */
    public ServiceException(Throwable cause) {
        super(cause);
    }

}
