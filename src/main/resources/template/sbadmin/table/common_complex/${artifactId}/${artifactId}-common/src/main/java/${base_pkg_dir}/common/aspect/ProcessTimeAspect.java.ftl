package ${base_pkg}.common.aspect;

import ${base_pkg}.common.annotation.LoggerProcessTime;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Method;

/**
 * <B>Project: common-tools</B><BR/>
 * <B>Description: 日志记录方法执行时间逻辑类 </B><BR/>
 * <B>Copyright:Copyright(c)2018 by FORWAY R&D Corporation, Inc. All rights
 * reserved.</B><BR/>
 * @createtime May 29, 2018 10:38:05 PM
 * @author <a href="mailto:china.wujianjun@gmail.com">Wujianjun</a>
 * @version 1.0
 **/
public class ProcessTimeAspect {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    private long error = 5000L;
    private long warn = 3000L;
    private long info = 1000L;

    public ProcessTimeAspect() {
    }

    public ProcessTimeAspect(long error, long warn, long info) {
        this.error = error;
        this.warn = warn;
        this.info = info;
    }

    public void setError(long error) {
        this.error = error;
    }

    public void setWarn(long warn) {
        this.warn = warn;
    }

    public void setInfo(long info) {
        this.info = info;
    }

    public Object loggerProcessTime(ProceedingJoinPoint joinPoint) throws Throwable {
        final MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
        final Method method = joinPoint.getTarget().getClass().getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
        final LoggerProcessTime printProcessTimeAnnotation = method.getAnnotation(LoggerProcessTime.class);
        final long beginTime = System.currentTimeMillis();
        Object result;
        try {
            result = joinPoint.proceed(joinPoint.getArgs());
        }
        finally{
            final long processTime = System.currentTimeMillis() - beginTime;
            String message = joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + " processing takes " + processTime + " ms";
            printLog(processTime, message, printProcessTimeAnnotation);
        }
        return result;
    }

    protected void printLog(long processTime, String message, LoggerProcessTime timeAnnotation) {
        if (processTime >= (timeAnnotation == null ? this.error:timeAnnotation.error())) {
            logger.error(message);
            return;
        }
        if (processTime >= (timeAnnotation == null ? this.warn:timeAnnotation.warn())) {
            logger.warn(message);
            return;
        }
        if (processTime >= (timeAnnotation == null ? this.info:timeAnnotation.info())) {
            logger.info(message);
            return;
        }
        logger.debug(message);
    }
}