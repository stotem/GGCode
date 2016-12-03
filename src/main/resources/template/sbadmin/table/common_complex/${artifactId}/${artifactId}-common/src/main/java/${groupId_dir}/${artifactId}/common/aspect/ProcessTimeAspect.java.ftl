package ${groupId}.${artifactId}.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

<#include "/basic/author.include"/>
public final class ProcessTimeAspect {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    private long warnLimit = 5000L;
    private long infoLimit = 1000L;
    private boolean levelLimit;

    public ProcessTimeAspect() {
        this(true);
    }

    public ProcessTimeAspect(boolean levelLimit) {
        this.levelLimit = levelLimit;
    }

    public void setWarnLimit(long warnLimit) {
        this.warnLimit = warnLimit;
    }

    public void setInfoLimit(long infoLimit) {
        this.infoLimit = infoLimit;
    }

    public Object loggerProcessTime(ProceedingJoinPoint pjp) throws Throwable {
        final long beginTime = System.currentTimeMillis();
        Object result = null;
        try {
            result = pjp.proceed(pjp.getArgs());
        }
        finally{
            final long processTime = System.currentTimeMillis() - beginTime;
            String message = pjp.getTarget().getClass().getName()+"."+pjp.getSignature().getName()+" processing takes "+processTime+" ms";
            printLog(processTime, message);
        }
        return result;
    }

    protected void printLog(long processTime, String message) {
        if (!levelLimit) {
            logger.info(message);
            return;
        }
        if(processTime > warnLimit) {
            logger.warn(message);
            return;
        }
        if (processTime > infoLimit) {
            logger.info(message);
            return;
        }
        logger.debug(message);
    }
}