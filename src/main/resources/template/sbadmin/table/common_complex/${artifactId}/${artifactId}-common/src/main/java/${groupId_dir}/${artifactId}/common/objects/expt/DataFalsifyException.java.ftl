package ${groupId}.${artifactId}.common.objects.expt;

/**
 * <B>Description</B> 数据篡改异常 <br />
 * <B>Copyright</B> Copyright (c) 2014 www.diligrp.com All rights reserved. <br />
 * 本软件源代码版权归地利集团,未经许可不得任意复制与传播.<br />
 * <B>Company</B> 地利集团
 *
 * @author Wujianjun
 * @createTime 16/7/13 11:36
 */
public class DataFalsifyException extends RollbackException {
    /**
     * create DataFalsifyException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     */
    public DataFalsifyException() {
        this("数据已被篡改");
    }

    /**
     * create DataFalsifyException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param message
     * @param cause
     */
    public DataFalsifyException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * create DataFalsifyException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param message
     */
    public DataFalsifyException(String message) {
        super(message);
    }

    /**
     * create DataFalsifyException instance
     * @author Wujianjun
     * @createtime May 29, 2014 11:18:25 PM
     * @param cause
     */
    public DataFalsifyException(Throwable cause) {
        super(cause);
    }
}
