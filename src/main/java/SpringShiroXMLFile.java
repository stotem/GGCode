import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * <B>Description</B>  <br />
 * <B>Copyright</B> Copyright (c) 2014 www.diligrp.com All rights reserved. <br />
 * 本软件源代码版权归地利集团,未经许可不得任意复制与传播.<br />
 * <B>Company</B> 地利集团
 *
 * @author Wujianjun
 * @createTime 16/8/2 10:56
 */
public class SpringShiroXMLFile extends PreTemplateFile {


    public SpringShiroXMLFile(File outRootDir) {
        super(outRootDir);
    }

    public void finishProcess() {
        StringBuffer shiroxmlFilePath = new StringBuffer(outRootDir.getAbsolutePath());
        final String artifactId = GeneratorProperties.getProperty("artifactId");
        shiroxmlFilePath.append(File.separator).append(artifactId);
        shiroxmlFilePath.append(File.separator).append(artifactId);
        shiroxmlFilePath.append("-web");
        shiroxmlFilePath.append(File.separator).append("src");
        shiroxmlFilePath.append(File.separator).append("main");
        StringBuffer utilFilePath = new StringBuffer(shiroxmlFilePath.toString());
        utilFilePath.append(File.separator).append("java");
        String groupIdDir = GeneratorProperties.getProperty("groupId");
        groupIdDir = groupIdDir.replace(".",File.separator);
        utilFilePath.append(File.separator).append(groupIdDir);
        utilFilePath.append(File.separator).append(artifactId);
        utilFilePath.append(File.separator).append("web");
        utilFilePath.append(File.separator).append("utils");
        utilFilePath.append(File.separator).append("ShiroUtils.java");
        shiroxmlFilePath.append(File.separator).append("resources");
        shiroxmlFilePath.append(File.separator).append("spring-shiro.xml");
        File shiroxmlFile = new File(shiroxmlFilePath.toString()).getAbsoluteFile();
        if (shiroxmlFile.exists()) {
            shiroxmlFile.delete();
        }
        File utilFile = new File(utilFilePath.toString()).getAbsoluteFile();
        if (utilFile.exists()) {
            utilFile.delete();
        }
    }

    public boolean support() {
        final String supportShiro = GeneratorProperties.getProperty("support_Shiro");
        return !(Boolean.valueOf(supportShiro));
    }
}
