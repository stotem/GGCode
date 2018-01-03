<#include "/basic/macro.include"/>

package ${groupId}.${artifactId}.provider.persistence;

import ${groupId}.${artifactId}.domain.${className};
import org.springframework.stereotype.Component;

<#include "/basic/author.include"/>
@Component
public interface ${className}Dao extends BaseDao<${className}, Long> {
    // Other operation put to here
}
