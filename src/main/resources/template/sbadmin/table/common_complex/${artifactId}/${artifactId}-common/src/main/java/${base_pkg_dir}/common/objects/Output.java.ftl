/*
 * @(#) common-tools Output.java Jun 12, 2014
 * 
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects;


/**
 * <B>Project: common-tools</B><BR />
 * <B>Description: Output </B><BR />
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR />
 * @createtime Jun 12, 2014 8:43:53 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class Output<T> implements java.io.Serializable {
    /**
     * 成功
     */
    public static final int CODE_SUCCESS = 200;
    /**
     * 失败
     */
    public static final int CODE_FAIL = 900000100;
    /**
     * 异常
     */
    public static final int CODE_EXCEPTION = 900000200;
    
    private int code;
    private String message;
    private T result;

    protected Output() {
    }
    
    public static <T> Output<T> create(Class<T> cls) {
        return new Output<T>();
    }

    public Output<T> setCode(int code) {
        this.code = code;
        return this;
    }

    public Output<T> setMessage(String message) {
        this.message = message;
        return this;
    }

    /**
     * set result value
     * @author Wujianjun
     * @createtime Jun 12, 2014 8:51:39 PM
     * @param result the result to set
     * @return this instance
     */
    public Output<T> setResult(T result) {
        this.result = result;
        return this;
    }
    
    /**
     * 设置为成功
     * @author Wujianjun
     * @createtime Jun 12, 2014 9:26:28 PM
     * @return this instance
     */
    public Output<T> setSuccess() {
        return setCode(CODE_SUCCESS);
    }

    /**
     * 判断是否成功
     * @author Wujianjun
     * @createtime Jun 12, 2014 9:05:35 PM
     * @return true: 成功，false: 失败
     */
    public boolean isSuccess() {
        return this.code == CODE_SUCCESS;
    }

    /**
     * get code value
     * @author Wujianjun
     * @createtime Jun 12, 2014 9:05:29 PM
     * @return the code
     */
    public int getCode() {
        return code;
    }

    /**
     * get message value
     * @author Wujianjun
     * @createtime Jun 12, 2014 9:05:29 PM
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * get result value
     * @author Wujianjun
     * @createtime Jun 12, 2014 9:05:29 PM
     * @return the result
     */
    public T getResult() {
        return result;
    }

}
