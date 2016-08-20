package ${groupId}.${artifactId}.manager.utils;

import java.nio.charset.Charset;

<#include "/basic/author.include"/>
public class StringRedisSerializer extends org.springframework.data.redis.serializer.StringRedisSerializer {
    private String prefix = "";

    public StringRedisSerializer() {
        super();
    }

    public StringRedisSerializer(Charset charset) {
        super(charset);
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }


    @Override
    public byte[] serialize(String string) {
        return super.serialize(prefix+string);
    }
}
