package ${groupId}.${artifactId}.common.tools;

/**
 * <B>Title: TypeConvert.java</B><BR/><BR/>
 * <B>Description: 类型转换工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 5:49:29 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 */
public class TypeConvert {

    /**
     * byte[]转short
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @param offset 偏移量
     * @return byte转成short后的值
     */
    public static short toShort(byte[] b, int offset) {
        return (short) (((int) (b[offset] & 0xff)) | ((int) (b[offset + 1] & 0xff) << 8));
    }

    /**
     * byte[]转short
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @return byte转成short后的值
     */
    public static short toShort(byte[] b) {
        return toShort(b, 0);
    }

    /**
     * byte[]转int
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @param offset 偏移量
     * @return byte转成int后的值
     */
    public static int toInt(byte[] b, int offset) {
        return ((int) (b[offset] & 0xff)) | ((int) (b[offset + 1] & 0xff) << 8)
                | ((int) (b[offset + 2] & 0xff) << (2 * 8)) | ((int) (b[offset + 3] & 0xff) << (3 * 8));
    }

    /**
     * byte[]转int
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @return byte转成int后的值
     */
    public static int toInt(byte[] b) {
        return toInt(b, 0);
    }

    /**
     * byte[]转long
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @return byte转成long后的值
     */
    public static long toLong(byte[] b) {
        return toLong(b, 0);
    }

    /**
     * byte[]转long
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param b byte数组
     * @param offset byte数组偏移量
     * @return byte转成long后的值
     */
    public static long toLong(byte[] b, int offset) {

        return ((long) b[offset] & 0xff) | ((long) (b[offset + 1] & 0xff) << 8)
                | ((long) (b[offset + 2] & 0xff) << (8 * 2)) | ((long) (b[offset + 3] & 0xff) << (8 * 3))
                | ((long) (b[offset + 4] & 0xff) << (4 * 8)) | ((long) (b[offset + 5] & 0xff) << (5 * 8))
                | ((long) (b[offset + 6] & 0xff) << (6 * 8)) | ((long) (b[offset + 7] & 0xff) << (7 * 8));
    }

    /**
     * int转向byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param n int值
     * @return int转成byte数组后的值
     */
    public static byte[] toByte(int n) {
        byte[] b = new byte[4];
        toByte(n, b, 0);
        return b;
    }

    /**
     * int转向byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:52:29 PM
     * @param n int值
     * @param buf int转成byte数组后的值
     * @return 偏移量
     */
    public static void toByte(int n, byte[] buf, int offset) {
        for (int i = offset; i < offset + 4; i++) {
            buf[i] = (byte) (n & 0xff);// 将最低位保存在最低位
            n >>= 8; // 向右移8位
        }
    }

    /**
     * short转成byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:56:48 PM
     * @param n short值
     * @return byte[]
     */
    public static byte[] toByte(short n) {
        byte[] b = new byte[2];
        toByte(n, b, 0);
        return b;
    }

    /**
     * 转成byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:59:55 PM
     * @param n 数据
     * @param buf byte数组
     * @param offset 偏移量
     */
    public static void toByte(short n, byte[] buf, int offset) {
        for (int i = offset; i < offset + 2; i++) {
            buf[i] = (byte) (n & 0xff);// 将最低位保存在最低位
            n >>= 8; // 向右移8位
        }
    }

    /**
     * 转成byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 6:00:22 PM
     * @param n 数据
     * @return byte[]
     */
    public static byte[] toByte(long n) {
        byte[] b = new byte[8];
        toByte(n, b, 0);
        return b;
    }

    /**
     * 转成byte[]
     * @author Wujianjun
     * @createtime Feb 11, 2012 6:00:44 PM
     * @param n 数据
     * @param buf byte[]
     * @param offset 偏移量
     */
    public static void toByte(long n, byte[] buf, int offset) {
        for (int i = offset; i < offset + 8; i++) {
            buf[i] = (byte) (n & 0xff);// 将最低位保存在最低位
            n >>= 8; // 向右移8位
        }
    }

    /**
     * 将字节集合转成String
     * @author Wujianjun
     * @createtime Feb 11, 2012 4:56:12 PM
     * @param data 数据
     * @return 十六进制表达形式
     */
    public static String toHexString(byte[] bytes) {
        if ( Tools.isNull(bytes) ) {
            return null;
        }
        StringBuilder result = new StringBuilder(bytes.length * 3);
        String tmpByte = null;
        byte[] arrayOfByte = bytes;
        int j = bytes.length;
        for (int i = 0; i < j; i++) {
            byte b = arrayOfByte[i];
            tmpByte = Integer.toHexString(0xFF & b).toUpperCase();
            result.append(tmpByte.length() < 2 ? "0" + tmpByte : tmpByte);
            result.append(" ");
        }
        return result.toString();
    }
}
