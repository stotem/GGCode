/*
 * @(#) common-tools Condition.java Jun 1, 2014
 *
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.objects;

import java.util.LinkedHashMap;
/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: 条件类 </B><BR/>
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights reserved.</B><BR/>
 * @createtime Jun 1, 2014 6:20:43 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class Condition extends LinkedHashMap<String, Object> {

    /**
     * long serialVersionUID 
     */
    private static final long serialVersionUID = -6862057026952600948L;

    /*
     * (non-Javadoc)
     * @see java.util.HashMap#put(java.lang.Object, java.lang.Object)
     */
    @Override
    public Condition put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
