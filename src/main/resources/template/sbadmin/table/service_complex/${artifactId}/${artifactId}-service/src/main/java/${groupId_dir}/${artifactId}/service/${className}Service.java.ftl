<#include "/basic/macro.include"/>
package ${groupId}.${artifactId}.service;

import ${groupId}.${artifactId}.domain.${className};

import ${groupId}.${artifactId}.common.objects.MapOutput;
import ${groupId}.${artifactId}.common.objects.PageCondition;
import ${groupId}.${artifactId}.common.objects.expt.ServiceException;

<#include "/basic/author.include"/>
public interface ${className}Service {

    MapOutput listByPageCondition(PageCondition condition) throws ServiceException;

    ${className} getById(Long id) throws ServiceException;

    void delById(Long id) throws ServiceException;

    void updateById(${className} ${classNameLower}) throws ServiceException;

    void save(${className} ${classNameLower}) throws ServiceException;
}
