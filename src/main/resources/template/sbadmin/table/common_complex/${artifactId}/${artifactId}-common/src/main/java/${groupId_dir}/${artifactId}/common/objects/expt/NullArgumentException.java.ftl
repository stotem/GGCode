/*
 * @(#) common-tools NullArgumentException.java May 29, 2014
 * 
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: NullArgumentException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2014 11:27:27 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class NullArgumentException extends ValidateException {

    /**
     * create NullArgumentException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:27:35 PM
     */
    public NullArgumentException() {
        this("没有获取到参数");
    }

    /**
     * create NullArgumentException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:27:35 PM
     * @param message
     * @param cause
     */
    public NullArgumentException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create NullArgumentException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:27:35 PM
     * @param message
     */
    public NullArgumentException(String message) {
        super(message);
    }

    /**
     * create NullArgumentException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:27:35 PM
     * @param cause
     */
    public NullArgumentException(Throwable cause) {
        super(cause);
    }

}
