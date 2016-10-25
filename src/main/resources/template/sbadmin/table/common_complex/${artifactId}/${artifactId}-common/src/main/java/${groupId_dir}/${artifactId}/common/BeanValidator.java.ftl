package ${groupId}.${artifactId}.common;

import ${groupId}.${artifactId}.common.objects.expt.ValidateException;
import ${groupId}.${artifactId}.common.tools.Tools;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.Set;

<#include "/basic/author.include"/>
public final class BeanValidator {

    private static Validator validator;
    static{
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
    }

    public static void validator(Object bean) throws ValidateException{
        final StringBuffer buf = new StringBuffer();
        if(Tools.isNull(bean)){
            buf.append("对象实例为null");
            throw new ValidateException(buf.toString());
        }
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(bean);
        for (ConstraintViolation<Object> constraintViolation : constraintViolations) {
            buf.append(constraintViolation.getMessage()).append("; ");
        }
        final String value = buf.toString();
        if(Tools.isEmpty(value)){
            throw new ValidateException(buf.toString());
        }
    }
}
