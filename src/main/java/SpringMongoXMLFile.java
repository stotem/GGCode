import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * <B>Description</B>  <br />
 * <B>Copyright</B> Copyright (c) 2014 www.diligrp.com All rights reserved. <br />
 * 本软件源代码版权归地利集团,未经许可不得任意复制与传播.<br />
 * <B>Company</B> 地利集团
 *
 * @author Wujianjun
 * @createTime 16/7/21 10:35
 */
public class SpringMongoXMLFile extends PreTemplateFile {

    public SpringMongoXMLFile(File outRootDir) {
        super(outRootDir);
    }

    public void finishProcess() {
        StringBuffer filePath = new StringBuffer(outRootDir.getAbsolutePath());
        final String artifactId = GeneratorProperties.getProperty("artifactId");
        filePath.append(File.separator).append(artifactId);
        filePath.append(File.separator).append(artifactId);
        filePath.append("-provider");
        filePath.append(File.separator).append("src");
        filePath.append(File.separator).append("main");
        filePath.append(File.separator).append("resources");
        filePath.append(File.separator).append("spring-mongo.xml");
        File springMongoXML = new File(filePath.toString()).getAbsoluteFile();
        if (springMongoXML.exists()) {
            springMongoXML.delete();
        }
    }

    public boolean support() {
        final String supportMongoDB = GeneratorProperties.getProperty("support_mongoDB");
        return !(Boolean.valueOf(supportMongoDB));
    }
}
