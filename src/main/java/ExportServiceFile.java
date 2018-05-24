import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * Created by wujianjun on 16-11-2.
 */
public class ExportServiceFile extends PreTemplateFile {

    public ExportServiceFile(File outRootDir) {
        super(outRootDir);
    }

    public void finishProcess() {
        StringBuffer providerFilePath = new StringBuffer(outRootDir.getAbsolutePath());
        final String artifactId = GeneratorProperties.getProperty("artifactId");
        providerFilePath.append(File.separator).append(artifactId);
        providerFilePath.append(File.separator).append("service-provider");

        providerFilePath.append(File.separator).append("src");
        providerFilePath.append(File.separator).append("main");
        providerFilePath.append(File.separator).append("resources");
        providerFilePath.append(File.separator).append("spring-dubbo.xml");

        File dubboXMLFile = new File(providerFilePath.toString()).getAbsoluteFile();
        if (dubboXMLFile.exists()) {
            dubboXMLFile.delete();
        }
    }

    public boolean support() {
        final String supportDubbo = GeneratorProperties.getProperty("support_Dubbo");
        final String exportProviderService = GeneratorProperties.getProperty("export_provider_service");
        return Boolean.valueOf(supportDubbo) && !(Boolean.valueOf(exportProviderService));
    }
}
