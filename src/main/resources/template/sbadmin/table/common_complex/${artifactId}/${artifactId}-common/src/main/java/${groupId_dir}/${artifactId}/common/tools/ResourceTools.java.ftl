package ${groupId}.${artifactId}.common.tools;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.Properties;

/**
 * <B>Title: ResourceTools.java</B><BR/><BR/>
 * <B>Description: 资源工具类</B><BR/><BR/>
 * <B>Copyright:Copyright(c) 2012 stotem </B><BR/><BR/>
 * <B>CreateTime: Feb 11, 2012 5:00:24 PM</B><BR/><BR/>
 * @author Wujianjun
 * @version 1.0
 */
public class ResourceTools {
    private static Properties resources = null;

    static {
        try {
            setLocale("resource", Locale.getDefault());
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 设置当前地区
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:02:29 PM
     * @param resource
     * @param locale
     * @throws IOException
     */
    public static void setLocale(String resource, Locale locale) throws IOException {
        InputStream inputStream = ResourceTools.class.getResourceAsStream(resource + "_" + locale + ".properties");
        resources = new Properties();
        try {
            resources.load(inputStream);
        }
        finally {
            if ( !Tools.isNull(inputStream) ) {
                inputStream.close();
                inputStream = null;
            }
        }
    }

    /**
     * 得到指定KEY的配置值
     * @author Wujianjun
     * @createtime Feb 11, 2012 5:02:49 PM
     * @param key 指定KEY
     * @return 配置值
     */
    public static String getValue(String key) {
        return resources.getProperty(key);
    }
}
