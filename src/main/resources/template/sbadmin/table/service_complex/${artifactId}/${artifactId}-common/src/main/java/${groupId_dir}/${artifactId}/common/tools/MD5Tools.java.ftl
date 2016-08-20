/*
 * @(#) tools MD5Tools.java Feb 11, 2012
 * 
 * Copyright 2012 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * <B>Title: MD5Tools.java</B><BR/><BR/>
 * <B>Description: MD5加密工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 4:57:41 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 **/
public class MD5Tools {

    /**
     * 加密数据
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:59:09 PM
     * @param data 数据
     * @return 加密后的数据
     */
    public static String encrypt(String data) {
        byte[] dat = data.getBytes();
        return encrypt(dat, 0, dat.length);
    }

    /**
     * 加密数据
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:59:09 PM
     * @param data 数据
     * @param offset 加密偏移量
     * @param length 加密数据总长度
     * @return 加密后的数据
     */
    public static String encrypt(byte[] data, int offset, int length) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(data, offset, length);
            return TypeConvert.toHexString(md5.digest()).replaceAll(" ", "");
        }
        catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
