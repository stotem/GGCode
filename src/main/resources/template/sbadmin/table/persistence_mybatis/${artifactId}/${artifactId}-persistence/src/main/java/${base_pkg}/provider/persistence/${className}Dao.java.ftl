<#include "/basic/macro.include"/>

package ${base_pkg}.provider.persistence;

import ${base_pkg}.domain.${className};
import org.springframework.stereotype.Component;

<#include "/basic/author.include"/>
@Component
public interface ${className}Dao extends BaseDao<${className}, Long> {
    // Other operation put to here
}
