/*
 * @(#) common-tools AssertionException.java Jun 1, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects.expt;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: AssertionException </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime Jun 1, 2014 6:15:40 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class AssertionException extends RuntimeException {

    public AssertionException() {
        this("断言失败");
    }

    public AssertionException(String message) {
        super(message);
    }

    public AssertionException(String message, Throwable cause) {
        super(message, cause);
    }

    public AssertionException(Throwable cause) {
        super(cause);
    }
}
