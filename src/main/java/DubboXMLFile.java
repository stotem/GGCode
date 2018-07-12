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

        StringBuffer consumerFilePath = new StringBuffer(providerFilePath.toString());
        providerFilePath.append(File.separator).append("service-provider");
        providerFilePath.append(File.separator).append("src");
        providerFilePath.append(File.separator).append("main");
        providerFilePath.append(File.separator).append("resources");
        providerFilePath.append(File.separator).append("spring-dubbo.xml");

        consumerFilePath.append(File.separator).append(artifactId).append("-web");
        consumerFilePath.append(File.separator).append("src");
        consumerFilePath.append(File.separator).append("main");
        consumerFilePath.append(File.separator).append("resources");
        consumerFilePath.append(File.separator).append("spring-dubbo.xml");

        File dubboXMLFile = new File(providerFilePath.toString()).getAbsoluteFile();
        super.deleteFile(dubboXMLFile);

        dubboXMLFile = new File(consumerFilePath.toString()).getAbsoluteFile();
        super.deleteFile(dubboXMLFile);
    }

    public boolean support() {
        final String supportDubbo = GeneratorProperties.getProperty("support_Dubbo");
        return !(Boolean.valueOf(supportDubbo));
    }
}
