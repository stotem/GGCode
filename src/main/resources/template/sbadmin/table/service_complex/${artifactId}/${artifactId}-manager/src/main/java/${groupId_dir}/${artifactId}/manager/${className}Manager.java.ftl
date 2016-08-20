<#include "/basic/macro.include"/>
package ${groupId}.${artifactId}.manager;

import ${groupId}.${artifactId}.domain.${className};
import ${groupId}.${artifactId}.common.objects.PageCondition;
import ${groupId}.${artifactId}.common.objects.Condition;
import ${groupId}.${artifactId}.common.objects.MapOutput;
import ${groupId}.${artifactId}.common.objects.expt.ServiceException;

<#include "/basic/author.include"/>
public interface ${className}Manager {

    void save(${className} ${classNameLower}) throws ServiceException;

    MapOutput getPage(PageCondition condition) throws ServiceException;

    ${className} getById(Long id) throws ServiceException;

    void updateByCheck(${className} obj) throws ServiceException;

    void deleteById(Long id) throws ServiceException;
}
