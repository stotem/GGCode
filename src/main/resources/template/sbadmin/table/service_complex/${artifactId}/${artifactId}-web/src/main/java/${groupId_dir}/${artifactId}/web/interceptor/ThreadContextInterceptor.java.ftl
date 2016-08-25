package ${groupId}.${artifactId}.web.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import ${groupId}.${artifactId}.common.objects.ThreadContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <B>Description</B> 用于将当前Request与Response放入到ThreadLocal中 <br />
 * <B>Copyright</B> Copyright (c) 2014 FORWAY R&D All rights reserved. <br />
 * 本软件源代码版权归FORWAY R&D,未经许可不得任意复制与传播.<br />
 * <B>Project</B> common
 *
 * @author Wujianjun
 * @createtime 2014/9/1 23:22
 */
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
