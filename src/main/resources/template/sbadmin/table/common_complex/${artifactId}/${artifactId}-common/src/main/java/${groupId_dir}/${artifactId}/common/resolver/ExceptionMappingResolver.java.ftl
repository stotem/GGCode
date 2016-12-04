package ${groupId}.${artifactId}.common.resolver;

import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<#include "/basic/author.include"/>
public class ExceptionMappingResolver extends SimpleMappingExceptionResolver {

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        LoggerFactory.getLogger(ex.getStackTrace()[0].getClassName()).warn(ex.getMessage(), ex);
        return super.doResolveException(request, response, handler, ex);
    }
}
