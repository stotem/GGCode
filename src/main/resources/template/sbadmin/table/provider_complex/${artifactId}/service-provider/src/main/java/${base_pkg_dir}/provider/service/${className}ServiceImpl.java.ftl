<#include "/basic/macro.include"/>
package ${base_pkg}.provider.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import ${base_pkg}.domain.${className};
import ${base_pkg}.service.${className}Service;
import ${base_pkg}.provider.manager.${className}Manager;
import javax.annotation.Resource;

import ${base_pkg}.common.objects.MapOutput;
import ${base_pkg}.common.objects.PageCondition;
import ${base_pkg}.common.objects.expt.ServiceException;

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
