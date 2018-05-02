<#include "/basic/macro.include"/>
package ${base_pkg}.provider.manager;

import ${base_pkg}.domain.${className};
import ${base_pkg}.common.objects.PageCondition;
import ${base_pkg}.common.objects.MapOutput;
import ${base_pkg}.common.objects.expt.RollbackException;

<#include "/basic/author.include"/>
public interface ${className}Manager {

    void save(${className} ${classNameLower}) throws RollbackException;

    MapOutput getPage(PageCondition condition) throws RollbackException;

    ${className} getById(Long id) throws RollbackException;

    void updateByCheck(${className} obj) throws RollbackException;

    void deleteById(Long id) throws RollbackException;
}
