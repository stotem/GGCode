<#include "/basic/macro.include"/>
package ${groupId}.${artifactId}.manager;

import ${groupId}.${artifactId}.domain.${className};
import ${groupId}.${artifactId}.common.objects.PageCondition;
import ${groupId}.${artifactId}.common.objects.MapOutput;
import ${groupId}.${artifactId}.common.objects.expt.RollbackException;

<#include "/basic/author.include"/>
public interface ${className}Manager {

    void save(${className} ${classNameLower}) throws RollbackException;

    MapOutput getPage(PageCondition condition) throws RollbackException;

    ${className} getById(Long id) throws RollbackException;

    void updateByCheck(${className} obj) throws RollbackException;

    void deleteById(Long id) throws RollbackException;
}
