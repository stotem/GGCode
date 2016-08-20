/*
 * @(#) common-tools PathUtils.java Jun 14, 2014
 * 
 * Copyright 2014 FORWAY R&D Corporation, Inc. All rights reserved.
 */
package ${groupId}.${artifactId}.common.tools;

/**
 * <B>Project: common-com.forway.common.tools</B><BR />
 * <B>Description: TODO </B><BR />
 * <B>Copyright:Copyright(c)2014 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR />
 * @createtime Jun 14, 2014 11:17:22 AM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class PathUtils {
    private String localPrefix;
    private String resourcePrefix;

    /**
     * create PathUtils instance
     * @author Wujianjun
     * @createtime Jun 14, 2014 11:18:25 AM
     * @param localPrefix
     * @param resourcePrefix
     */
    public PathUtils(String localPrefix, String resourcePrefix) {
        super();
        this.localPrefix = localPrefix;
        this.resourcePrefix = resourcePrefix;
    }

    /**
     * 得到以本地路径前缀的本地资源URL
     * @author Wujianjun
     * @createtime Jun 14, 2014 11:22:02 AM
     * @param resource 本地资源URL
     * @return
     */
    public String getLocal(String resource) {
        if ( (localPrefix != null && localPrefix.endsWith("/")) || (resource != null && resource.startsWith("/")) ) {
            return localPrefix + resource;
        }
        return localPrefix + "/" + resource;
    }

    /**
     * 得到以资源路径前缀的本地资源URL
     * @author Wujianjun
     * @createtime Jun 14, 2014 11:22:30 AM
     * @param resource 资源URL
     * @return
     */
    public String getResource(String resource) {
        if ( (resourcePrefix != null && resourcePrefix.endsWith("/")) || (resource != null && resource.startsWith("/")) ) {
            return resourcePrefix + resource;
        }
        return resourcePrefix + "/" + resource;
    }
}
