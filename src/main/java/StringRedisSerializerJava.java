import cn.org.rapid_framework.generator.GeneratorProperties;

import java.io.File;

/**
 * <B>Description</B>  <br />
 * @author Wujianjun
 * @createTime 16/7/21 10:39
 */

public class StringRedisSerializerJava extends PreTemplateFile {

    public StringRedisSerializerJava(File outRootDir) {
        super(outRootDir);
    }

    public void finishProcess() {
        StringBuffer utilFilePath = new StringBuffer(outRootDir.getAbsolutePath());
        final String artifactId = GeneratorProperties.getProperty("artifactId");
        utilFilePath.append(File.separator).append(artifactId);
        utilFilePath.append(File.separator).append("service-provider");
        utilFilePath.append(File.separator).append("src");
        utilFilePath.append(File.separator).append("main");
        utilFilePath.append(File.separator).append("java");
        String basePkgDir = GeneratorProperties.getProperty("base_pkg");
        basePkgDir = basePkgDir.replace(".",File.separator);
        utilFilePath.append(File.separator).append(basePkgDir);
        utilFilePath.append(File.separator).append("provider");
        utilFilePath.append(File.separator).append("utils");
        utilFilePath.append(File.separator).append("StringRedisSerializer.java");
        File utilFile = new File(utilFilePath.toString()).getAbsoluteFile();
        if (utilFile.exists()) {
            utilFile.delete();
        }
    }

    public boolean support() {
        final String supportRedis = GeneratorProperties.getProperty("support_Redis");
        return !(Boolean.valueOf(supportRedis));
    }
}
