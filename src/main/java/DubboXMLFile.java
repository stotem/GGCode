import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * Created by wujianjun on 16-11-2.
 */
public class DubboXMLFile extends PreTemplateFile {

    public DubboXMLFile(File outRootDir) {
        super(outRootDir);
    }

    public void finishProcess() {
        StringBuffer providerFilePath = new StringBuffer(outRootDir.getAbsolutePath());
        final String artifactId = GeneratorProperties.getProperty("artifactId");
        providerFilePath.append(File.separator).append(artifactId);
        providerFilePath.append(File.separator).append(artifactId);

        StringBuffer customerFilePath = new StringBuffer(providerFilePath.toString());
        providerFilePath.append("-provider");
        providerFilePath.append(File.separator).append("src");
        providerFilePath.append(File.separator).append("main");
        providerFilePath.append(File.separator).append("resources");
        providerFilePath.append(File.separator).append("spring-dubbo.xml");

        customerFilePath.append("-web");
        customerFilePath.append(File.separator).append("src");
        customerFilePath.append(File.separator).append("main");
        customerFilePath.append(File.separator).append("resources");
        customerFilePath.append(File.separator).append("spring-dubbo.xml");

        File dubboXMLFile = new File(providerFilePath.toString()).getAbsoluteFile();
        if (dubboXMLFile.exists()) {
            dubboXMLFile.delete();
        }

        dubboXMLFile = new File(customerFilePath.toString()).getAbsoluteFile();
        if (dubboXMLFile.exists()) {
            dubboXMLFile.delete();
        }
    }

    public boolean support() {
        final String supportDubbo = GeneratorProperties.getProperty("support_Dubbo");
        return !(Boolean.valueOf(supportDubbo));
    }
}
