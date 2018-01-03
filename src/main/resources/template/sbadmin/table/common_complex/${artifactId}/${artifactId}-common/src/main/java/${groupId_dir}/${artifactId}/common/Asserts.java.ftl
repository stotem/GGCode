package ${groupId}.${artifactId}.common;

import ${groupId}.${artifactId}.common.objects.expt.ServiceException;

import java.util.Collection;
import java.util.Map;

<#include "/basic/author.include"/>
public abstract class Asserts {

    public static ServiceException getThrowException(Class<? extends ServiceException> exClass, String message, Object... formats) {
        try {
            return (message == null || message.trim().length() == 0) ? exClass.getConstructor().newInstance():
                    exClass.getConstructor(String.class).newInstance(String.format(message, formats));
        } catch (Exception e) {
            return new ServiceException(String.format("%s with %s-parameters of the constructor not found",
                    exClass.getName(), (message == null || message.trim().length() == 0) ? "None":"String"));
        }
    }

    public static void isTrue(boolean expression) throws ServiceException {
        isTrue(expression, null);
    }

    public static void isTrue(boolean expression, String code, String message, Object... formats) throws ServiceException {
        if(!expression) {
            ServiceException exception = (ServiceException) getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }

    public static void isTrue(boolean expression, String message, Object... formats) throws ServiceException {
        if(!expression) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void isNull(Object object) throws ServiceException {
        isNull(object, null);
    }

    public static void isNull(Object object, String code, String message, Object... formats) throws ServiceException {
        if(object != null) {
            ServiceException exception = (ServiceException) getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }

    public static void isNull(Object object, String message, Object... formats) throws ServiceException {
        if(object != null) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void notNull(Object object) throws ServiceException {
        notNull(object, null);
    }

    public static void notNull(Object object, String code, String message, Object... formats) throws ServiceException {
        if(object == null) {
            ServiceException exception = getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }

    public static void notNull(Object object, String message, Object... formats) throws ServiceException {
        if(object == null) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void hasLength(String text) throws ServiceException {
        hasLength(text, null);
    }

    public static void hasLength(String text, String message, Object... formats) throws ServiceException {
        if(text == null || text.trim().length() == 0) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void hasLength(String text, String code, String message, Object... formats) throws ServiceException {
        if(text == null || text.trim().length() == 0) {
            ServiceException exception = getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }

    public static void notEmpty(Object[] array) throws ServiceException {
        notEmpty(array, null);
    }

    public static void notEmpty(Object[] array, String message, Object... formats) throws ServiceException {
        if(array == null || array.length ==0) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }
    public static void isEmpty(Collection<?> collection, String code, String message, Object... formats) throws ServiceException {
        if(collection != null && !collection.isEmpty()) {
            ServiceException exception = getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }
    public static void isEmpty(Collection<?> collection, String message, Object... formats) throws ServiceException {
        if(collection != null && !collection.isEmpty()) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void notEmpty(Collection<?> collection) throws ServiceException {
        notEmpty(collection, null);
    }

    public static void notEmpty(Collection<?> collection, String code, String message, Object... formats) throws ServiceException {
        if(collection == null || collection.isEmpty()) {
            ServiceException exception = getThrowException(ServiceException.class, message, formats);
            exception.setErrorCode(code);
            throw exception;
        }
    }

    public static void notEmpty(Collection<?> collection, String message, Object... formats) throws ServiceException {
        if(collection == null || collection.isEmpty()) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void notEmpty(Map<?, ?> map) throws ServiceException {
        notEmpty(map, null);
    }

    public static void notEmpty(Map<?, ?> map, String message, Object... formats) throws ServiceException {
        if(map == null || map.isEmpty()) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void noNullElements(Object[] array) throws ServiceException {
        noNullElements(array, null);
    }

    public static void noNullElements(Object[] array, String message, Object... formats) throws ServiceException {
        if(array != null) {
            for (Object element : array) {
                if(element == null) {
                    throw getThrowException(ServiceException.class, message, formats);
                }
            }
        }
    }

    public static void isInstanceOf(Class<?> type, Object obj) throws ServiceException {
        isInstanceOf(type, obj, null);
    }

    public static void isInstanceOf(Class<?> type, Object obj, String message, Object... formats) throws ServiceException {
        notNull(type, "Type to check against must not be null");
        if(!type.isInstance(obj)) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }

    public static void isAssignable(Class<?> superType, Class<?> subType) throws ServiceException {
        isAssignable(superType, subType, null);
    }

    public static void isAssignable(Class<?> superType, Class<?> subType, String message, Object... formats) throws ServiceException {
        notNull(superType, "Type to check against must not be null");
        if(subType == null || !superType.isAssignableFrom(subType)) {
            throw getThrowException(ServiceException.class, message, formats);
        }
    }
}
