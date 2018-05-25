package ${base_pkg}.common.objects;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * <B>Description</B> 线程上下文对象 <br />
 * <B>Copyright</B> Copyright (c) 2014 FORWAY R&D All rights reserved. <br />
 * 本软件源代码版权归FORWAY R&D,未经许可不得任意复制与传播.<br />
 * <B>Project</B> common
 *
 * @author Wujianjun
 * @createtime 2014/9/1 23:25
 */
public class ThreadContext {

    public static final String REQUEST = "context_req";
    public static final String RESPONSE = "context_resp";

    private static final ThreadLocal<Map<String, Object>> context = new ThreadLocal<Map<String, Object>>();

    public static void put(String key, Object val) {
        Map<String, Object> objectMap = context.get();
        if(objectMap == null) {
            objectMap = new LinkedHashMap<String, Object>();
            context.set(objectMap);
        }
        objectMap.put(key, val);
    }

    public static Object get(String key) {
        Map<String, Object> objectMap = context.get();
        if(objectMap == null || objectMap.isEmpty()) {
            return null;
        }
        return objectMap.get(key);
    }

    public static void clear() {
        Map<String, Object> objectMap = context.get();
        if(objectMap != null) {
            objectMap.clear();
        }
    }

    public static void clear(String key) {
        Map<String, Object> objectMap = context.get();
        if(objectMap != null) {
            objectMap.remove(key);
        }
    }

}
