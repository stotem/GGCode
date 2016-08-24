/*
 * @(#) common-tools ValidateException.java Jun 1, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: ValidateException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime Jun 1, 2014 6:15:00 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class ValidateException extends ServiceException {


    private String argName;

    /**
     * get argName value
     * @author Wujianjun
     * @createtime May 29, 2014 11:28:49 PM
     * @return the argName
     */
    public String getArgName() {
        return argName;
    }

    /**
     * set argName value
     * @author Wujianjun
     * @createtime May 29, 2014 11:28:49 PM
     * @param argName the argName to set
     * @return
     */
    public ValidateException setArgName(String argName) {
        this.argName = argName;
        return this;
    }
    
    /**
     * create ValidateException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:15:10 PM
     */
    public ValidateException() {
        super("数据校验时未通过");
    }

    /**
     * create ValidateException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:15:10 PM
     * @param message
     * @param cause
     */
    public ValidateException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create ValidateException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:15:10 PM
     * @param message
     */
    public ValidateException(String message) {
        super(message);
    }

    /**
     * create ValidateException instance
     * @author Wujianjun
     * @createtime Jun 1, 2014 6:15:10 PM
     * @param cause
     */
    public ValidateException(Throwable cause) {
        super(cause);
    }

    
}
