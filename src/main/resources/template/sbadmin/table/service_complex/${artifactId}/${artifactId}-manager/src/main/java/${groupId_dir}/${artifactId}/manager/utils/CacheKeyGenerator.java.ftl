package ${groupId}.${artifactId}.manager.utils;

import org.springframework.cache.interceptor.KeyGenerator;

import java.lang.reflect.Method;

<#include "/basic/author.include"/>
public class CacheKeyGenerator implements KeyGenerator {
    private String prefix;

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    @Override
    public Object generate(Object o, Method method, Object... objects) {
        StringBuffer key = new StringBuffer();
        if (prefix != null) {
            key.append(prefix);
            key.append(":");
        }
        key.append(o.getClass().getName());
        key.append(".");
        key.append(method.getName());
        key.append(":");
        return key;
    }
}
