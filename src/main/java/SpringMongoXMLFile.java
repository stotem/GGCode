import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * <B>Description</B>  <br />
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
        filePath.append(File.separator).append(artifactId + "-persistence");
        filePath.append(File.separator).append("src");
        filePath.append(File.separator).append("main");
        filePath.append(File.separator).append("resources");
        filePath.append(File.separator).append("spring-mongo.xml");
        File springMongoXML = new File(filePath.toString()).getAbsoluteFile();
        super.deleteFile(springMongoXML);
    }

    public boolean support() {
        final String supportMongoDB = GeneratorProperties.getProperty("support_mongoDB");
        return !(Boolean.valueOf(supportMongoDB));
    }
}
