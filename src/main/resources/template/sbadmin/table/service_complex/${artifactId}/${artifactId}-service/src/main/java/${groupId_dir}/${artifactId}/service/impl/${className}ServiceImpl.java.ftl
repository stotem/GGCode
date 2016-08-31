<#include "/basic/macro.include"/>
package ${groupId}.${artifactId}.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import ${groupId}.${artifactId}.domain.${className};
import ${groupId}.${artifactId}.service.${className}Service;
import ${groupId}.${artifactId}.manager.${className}Manager;
import javax.annotation.Resource;

import ${groupId}.${artifactId}.common.objects.MapOutput;
import ${groupId}.${artifactId}.common.objects.PageCondition;
import ${groupId}.${artifactId}.common.objects.expt.ServiceException;

<#include "/basic/author.include"/>
@Service
public class ${className}ServiceImpl implements ${className}Service {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private ${className}Manager ${classNameLower}Manager;

    @Override
    public MapOutput listByPageCondition(PageCondition condition) throws ServiceException {
        return ${classNameLower}Manager.getPage(condition);
    }

    @Override
    public ${className} getById(Long id) throws ServiceException {
        return ${classNameLower}Manager.getById(id);
    }

    @Override
    public void delById(Long id) throws ServiceException {
        ${classNameLower}Manager.deleteById(id);
    }

    @Override
    public void updateById(${className} ${classNameLower}) throws ServiceException {
        ${classNameLower}Manager.updateByCheck(${classNameLower});
    }

    @Override
    public void save(${className} ${classNameLower}) throws ServiceException {
        ${classNameLower}Manager.save(${classNameLower});
    }
}
