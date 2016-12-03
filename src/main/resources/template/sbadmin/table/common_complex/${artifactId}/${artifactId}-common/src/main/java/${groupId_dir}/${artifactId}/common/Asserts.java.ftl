package ${groupId}.${artifactId}.common;

import ${groupId}.${artifactId}.common.objects.expt.AssertionException;
import ${groupId}.${artifactId}.common.tools.Tools;

import java.util.Collection;
import java.util.Map;

<#include "/basic/author.include"/>
public abstract class Asserts {

    public static RuntimeException getThrowException(Class<? extends RuntimeException> exClass, String message, Object... formats) {
        RuntimeException ex;
        try {
            ex = (Tools.isEmpty(message)) ? exClass.getConstructor().newInstance():
                    exClass.getConstructor(String.class).newInstance(String.format(message, formats));
        } catch (Exception e) {
            ex = new RuntimeException(String.format("%s with %s-parameters of the constructor not found",
                    exClass.getName(), Tools.isEmpty(message) ? "None":"String"));
        }
        return ex;
    }

    public static void isTrue(boolean expression) {
        isTrue(expression, null);
    }

    public static void isTrue(boolean expression, String message, Object... formats) {
        if(!expression) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void isNull(Object object) {
        isNull(object, null);
    }

    public static void isNull(Object object, String message, Object... formats) {
        if(object != null) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void notNull(Object object) {
        notNull(object, null);
    }

    public static void notNull(Object object, String message, Object... formats) {
        if(object == null) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void hasLength(String text) {
        hasLength(text, null);
    }

    public static void hasLength(String text, String message, Object... formats) {
        if(Tools.isEmpty(text)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void hasText(String text) {
        hasText(text, null);
    }

    public static void hasText(String text, String message, Object... formats) {
        if(Tools.isEmpty(text)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void doesNotContain(String textToSearch, String substring, String message, Object... formats) {
        if(!Tools.isEmpty(textToSearch) && !Tools.isEmpty(substring) && textToSearch.contains(substring)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void notEmpty(Object[] array) {
        notEmpty(array, null);
    }

    public static void notEmpty(Object[] array, String message, Object... formats) {
        if(Tools.isEmpty(array)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void isEmpty(Collection<?> collection, String message, Object... formats) {
        if(!Tools.isEmpty(collection)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void notEmpty(Collection<?> collection) {
        notEmpty(collection, null);
    }

    public static void notEmpty(Collection<?> collection, String message, Object... formats) {
        if(Tools.isEmpty(collection)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void notEmpty(Map<?, ?> map) {
        notEmpty(map, null);
    }

    public static void notEmpty(Map<?, ?> map, String message, Object... formats) {
        if(Tools.isEmpty(map)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void noNullElements(Object[] array) {
        noNullElements(array, null);
    }

    public static void noNullElements(Object[] array, String message, Object... formats) {
        if(array != null) {
            for (Object element : array) {
                if(element == null) {
                    throw getThrowException(AssertionException.class, message, formats);
                }
            }
        }
    }

    public static void isInstanceOf(Class<?> type, Object obj) {
        isInstanceOf(type, obj, null);
    }

    public static void isInstanceOf(Class<?> type, Object obj, String message, Object... formats) {
        notNull(type, "Type to check against must not be null");
        if(!type.isInstance(obj)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }

    public static void isAssignable(Class<?> superType, Class<?> subType) {
        isAssignable(superType, subType, null);
    }

    public static void isAssignable(Class<?> superType, Class<?> subType, String message, Object... formats) {
        notNull(superType, "Type to check against must not be null");
        if(subType == null || !superType.isAssignableFrom(subType)) {
            throw getThrowException(AssertionException.class, message, formats);
        }
    }
}
