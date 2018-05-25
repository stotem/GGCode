/*
 * @(#) common-tools MapOutput.java May 29, 2014
 * 
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${base_pkg}.common.objects;

import java.util.Hashtable;
import java.util.Map;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: MapOutput </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2014 10:38:05 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class MapOutput extends Output<Map<String,Object>> {
    
    private static final int INIT_MAP_SIZE = 1;
    
    private MapOutput() {}
    
    public static MapOutput createSuccess() {
        return (MapOutput) create().setSuccess();
    }

    public static MapOutput createFail(int code, String message) {
        return (MapOutput) create().setCode(code).setMessage(message);
    }

    public static MapOutput create() {
        return new MapOutput();
    }

    public MapOutput addResult(Map<String, Object> values) {
        synchronized (this) {
            Map<String, Object> result = getResult();
            if ( result == null ) {
                setResult(new Hashtable<String, Object>(INIT_MAP_SIZE));
            }
        }
        getResult().putAll(values);
        return this;
    }

    public MapOutput addResult(String key, Object value) {
        synchronized (this) {
            Map<String, Object> result = getResult();
            if ( result == null ) {
                setResult(new Hashtable<String, Object>(INIT_MAP_SIZE));
            }
        }
        getResult().put(key, value);
        return this;
    }

    public Object getValue(String key) {
        Map<String, Object> result = getResult();
        return result == null ? null : result.get(key);
    }
}
