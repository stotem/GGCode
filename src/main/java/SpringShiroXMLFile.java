import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * <B>Description</B>  <br />
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
        shiroxmlFilePath.append(File.separator).append(artifactId).append("-web");
        shiroxmlFilePath.append(File.separator).append("src");
        shiroxmlFilePath.append(File.separator).append("main");
        StringBuffer utilFilePath = new StringBuffer(shiroxmlFilePath.toString());
        utilFilePath.append(File.separator).append("java");
        String basePkgDir = GeneratorProperties.getProperty("base_pkg");
        basePkgDir = basePkgDir.replace(".",File.separator);
        utilFilePath.append(File.separator).append(basePkgDir);
        utilFilePath.append(File.separator).append("web");
        utilFilePath.append(File.separator).append("utils");
        utilFilePath.append(File.separator).append("ShiroUtils.java");
        shiroxmlFilePath.append(File.separator).append("resources");
        shiroxmlFilePath.append(File.separator).append("spring-shiro.xml");
        File shiroxmlFile = new File(shiroxmlFilePath.toString()).getAbsoluteFile();
        super.deleteFile(shiroxmlFile);
        File utilFile = new File(utilFilePath.toString()).getAbsoluteFile();
        super.deleteFile(utilFile);
    }

    public boolean support() {
        final String supportShiro = GeneratorProperties.getProperty("support_Shiro");
        return !(Boolean.valueOf(supportShiro));
    }
}
