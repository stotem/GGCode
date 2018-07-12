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
        File configFile = new File(providerFilePath.toString().concat(File.separator).concat("config").concat(File.separator)).getAbsoluteFile();
        super.deleteFile(configFile);

        final String supportDubbo = GeneratorProperties.getProperty("support_Dubbo");
        if(Boolean.valueOf(supportDubbo)) {
            File dubboXMLFile = new File(providerFilePath.toString().concat(File.separator).concat("spring-dubbo.xml")).getAbsoluteFile();
            super.deleteFile(dubboXMLFile);
        }
    }

    public boolean support() {
        final String exportProviderService = GeneratorProperties.getProperty("export_provider_service");
        return !Boolean.valueOf(exportProviderService);
    }
}
