<#include "/basic/macro.include"/>
package ${base_pkg}.service;

import ${base_pkg}.domain.${className};

import ${base_pkg}.common.objects.MapOutput;
import ${base_pkg}.common.objects.PageCondition;
import ${base_pkg}.common.objects.expt.ServiceException;

<#include "/basic/author.include"/>
public interface ${className}Service {

    MapOutput listByPageCondition(PageCondition condition) throws ServiceException;

    ${className} getById(Long id) throws ServiceException;

    void delById(Long id) throws ServiceException;

    void updateById(${className} ${classNameLower}) throws ServiceException;

    void save(${className} ${classNameLower}) throws ServiceException;
}
