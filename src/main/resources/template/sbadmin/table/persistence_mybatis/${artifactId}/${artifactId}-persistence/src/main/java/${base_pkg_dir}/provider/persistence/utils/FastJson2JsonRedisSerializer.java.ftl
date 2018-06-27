package ${base_pkg}.provider.persistence.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import java.nio.charset.Charset;

<#include "/basic/author.include"/>
public class FastJson2JsonRedisSerializer implements RedisSerializer<Object> {
    public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

    public FastJson2JsonRedisSerializer() {
        super();
        ParserConfig.getGlobalInstance().setAutoTypeSupport(true);
    }

    @Override
    public byte[] serialize(Object t) throws SerializationException {
        if (t == null) {
            return new byte[0];
        }
        if (String.class.equals(t.getClass())) {
            return t.toString().getBytes();
        }
        return JSON.toJSONString(t, SerializerFeature.WriteClassName).getBytes(DEFAULT_CHARSET);
    }

    @Override
    public Object deserialize(byte[] bytes) throws SerializationException {
        if (bytes == null || bytes.length <= 0) {
            return null;
        }
        final String str = new String(bytes, DEFAULT_CHARSET);
        return str.indexOf("@type") > 0 ? JSON.parseObject(str, Object.class):str;
    }
}
