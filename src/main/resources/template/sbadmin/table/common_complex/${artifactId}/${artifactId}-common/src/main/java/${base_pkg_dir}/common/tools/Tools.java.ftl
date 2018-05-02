package ${base_pkg}.common.tools;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * <B>Title: Tools.java</B><BR/><BR/>
 * <B>Description: 常用工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 5:11:20 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 */
public class Tools {

    /**
     * 截取byte数组
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:14:18 PM
     * @param src 源数据
     * @param offset 偏移量
     * @param length 截取长度
     * @return 子byte数组
     */
    public static byte[] subArray(byte[] src, int offset, int length) {
        byte[] sub = new byte[length];
        System.arraycopy(src, offset, sub, 0, length);
        return sub;
    }

    /**
     * 比较两个byte指定元素是否相同
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:32:30 PM
     * @param data1 数据1
     * @param offset1 数据1偏移量
     * @param data2 数据2
     * @param offset2 数据2偏移量
     * @param length 比较长度
     * @return 是否相同
     */
    public static boolean equals(byte[] data1, int offset1, byte[] data2, int offset2, int length) {
        for (int i = 0; i < length; i++) {
            if ( data1[(offset1 + i)] != data2[(offset2 + i)] ) {
                return false;
            }
        }
        return true;
    }

    /**
     * 在byte数组中查找指定byte的索引
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:34:22 PM
     * @param src byte数组
     * @param b 需要查找的byte
     * @return byte在数组的索引，没有找到则返回-1
     */
    public static int indexOf(byte[] src, byte b) {
        return indexOf(src, 0, src.length, b);
    }

    /**
     * 在byte数组中查找指定byte的索引
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:37:50 PM
     * @param src byte数组
     * @param offset 开始位置偏移量
     * @param length 查找byte数组的长度
     * @param b 需要查找的byte
     * @return byte在数组的索引，没有找到则返回-1
     */
    public static int indexOf(byte[] src, int offset, int length, byte b) {
        if ( src == null ) {
            return -1;
        }
        if ( src.length < offset + length ) {
            return -1;
        }
        if ( (offset > src.length - 1) || (offset < 0) ) {
            return -1;
        }
        for (int i = offset; i < offset + length; i++) {
            if ( src[i] == b ) {
                return i;
            }
        }
        return -1;
    }

    /**
     * 忽略编码
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:38:45 PM
     * @param str 原数据
     * @return 忽略编码后的数据
     */
    public static String correctEncoding(String str) {
        if ( str == null ) {
            return null;
        }
        for (int i = 0; i < str.length(); i++) {
            if ( str.charAt(i) > 'ÿ' )
                return str;
        }
        try {
            return new String(str.getBytes("iso8859-1"));
        }
        catch (Exception ex) {
        }
        return str;
    }

    /**
     * 判断是否为null
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:39:11 PM
     * @param value 对象
     * @return 是否为null
     */
    public static boolean isNull(Object value) {
        return value == null;
    }

    /**
     * 判断是否为null或者为空串
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:39:11 PM
     * @param value 字符串对象
     * @return 是否为null或者为空串
     */
    public static boolean isEmpty(String value) {
        if ( isNull(value) ) {
            return true;
        }
        return value.trim().length() <= 0;
    }
    /**
     * 判断是否为null或者内部元素为空
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:39:11 PM
     * @param collection 集合对象 
     * @return 是否为null或者内部元素为空
     */
    public static boolean isEmpty(Collection<?> collection) {
        if ( isNull(collection) ) {
            return true;
        }
        return collection.isEmpty();
    }

    /**
     * 判断list是否为null或者不存在元素
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:42:16 PM
     * @param list list
     * @return 是否为null或者不存在元素
     */
    public static boolean isEmpty(List<?> list) {
        return isNull(list) || (list.isEmpty());
    }

    /**
     * 判断obj数组是否为null或者不存在元素
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:42:16 PM
     * @param obj obj数组
     * @return 是否为null或者不存在元素
     */
    public static boolean isEmpty(Object[] obj) {
        return isNull(obj) || (obj.length == 0);
    }

    /**
     * 判断map是否为null或者不存在元素
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:42:16 PM
     * @param map map
     * @return 是否为null或者不存在元素
     */
    public static boolean isEmpty(Map<?, ?> map) {
        return isNull(map) || (map.isEmpty());
    }

    /**
     * 判断字符串是否为数值
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:42:16 PM
     * @param value 字符串
     * @return 是否为数值
     */
    public static boolean isNumber(String value) {
        return isEmpty(value) ? false : value.trim().matches("[0-9]*");
    }

    /**
     * 使用指定连接符对对象数组进行连接
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:45:14 PM
     * @param values 对象数组
     * @param joinChar 连接符
     * @return 连接后的字符串
     */
    public static String join(Object[] values, char joinChar) {
        if ( isEmpty(values) ) {
            return null;
        }
        StringBuffer result = new StringBuffer();
        Object[] arrayOfObject = values;
        int j = values.length;
        for (int i = 0; i < j; i++) {
            Object value = arrayOfObject[i];
            if ( isNull(value) ) {
                continue;
            }
            result.append(joinChar);
            result.append(value.toString());
        }
        return result.substring(1);
    }

    /**
     * 得到异常的堆栈信息
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:19:41 PM
     * @param t 异常对象
     * @return 堆栈信息
     */
    public static String getStackTrace(Throwable t) {
        if ( t == null ) {
            return null;
        }
        StringWriter sw = new StringWriter(256);
        t.printStackTrace(new PrintWriter(sw));
        return sw.toString();
    }
}
