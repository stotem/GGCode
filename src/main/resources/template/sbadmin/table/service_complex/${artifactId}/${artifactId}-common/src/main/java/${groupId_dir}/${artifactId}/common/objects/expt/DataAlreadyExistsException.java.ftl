/*
 * @(#) common-tools DataAlreadyExistsException.java May 29, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: TODO </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime May 29, 2014 11:21:51 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class DataAlreadyExistsException extends RollbackException {

    /**
     * create DataAlreadyExistsException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:22:15 PM
     */
    public DataAlreadyExistsException() {
        this("数据已经存在");
    }

    /**
     * create DataAlreadyExistsException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:22:15 PM
     * @param message
     * @param cause
     */
    public DataAlreadyExistsException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create DataAlreadyExistsException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:22:15 PM
     * @param message
     */
    public DataAlreadyExistsException(String message) {
        super(message);
    }

    /**
     * create DataAlreadyExistsException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:22:15 PM
     * @param cause
     */
    public DataAlreadyExistsException(Throwable cause) {
        super(cause);
    }

}
