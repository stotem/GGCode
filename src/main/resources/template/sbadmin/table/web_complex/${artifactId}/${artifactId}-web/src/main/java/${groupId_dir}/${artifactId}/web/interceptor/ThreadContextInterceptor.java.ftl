package ${groupId}.${artifactId}.web.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import ${groupId}.${artifactId}.common.objects.ThreadContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<#include "/basic/author.include"/>
public class ThreadContextInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        ThreadContext.put(ThreadContext.REQUEST, httpServletRequest);
        ThreadContext.put(ThreadContext.RESPONSE, httpServletResponse);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        ThreadContext.clear();
    }
}
