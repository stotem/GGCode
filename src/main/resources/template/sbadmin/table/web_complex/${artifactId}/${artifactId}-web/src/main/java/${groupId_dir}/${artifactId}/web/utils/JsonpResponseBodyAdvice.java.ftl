package ${groupId}.${artifactId}.web.utils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

<#include "/basic/author.include"/>
@ControllerAdvice(basePackages = "${groupId}.${artifactId}.web")
public class JsonpResponseBodyAdvice extends AbstractJsonpResponseBodyAdvice {

    public JsonpResponseBodyAdvice() {
        super("jsonpCallback", "jsonp", "callback");
    }
}