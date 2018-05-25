package ${base_pkg}.web.utils;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

<#include "/basic/author.include"/>
@ControllerAdvice(basePackages = "${base_pkg}.web")
public class JsonpResponseBodyAdvice extends AbstractJsonpResponseBodyAdvice {

    public JsonpResponseBodyAdvice() {
        super("jsonpCallback", "jsonp", "callback");
    }
}