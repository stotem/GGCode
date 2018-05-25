<#include "/basic/macro.include" />
package ${base_pkg}.domain;

import javax.validation.constraints.Size;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import java.sql.Timestamp;
import java.util.*;

<#include "/basic/author.include"/>
public class ${className} extends BaseDomain {

<#--字段-->
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase
    || column.columnNameLowerCase == "createdtime"
    || column.columnNameLowerCase == "updatedtime"
    || column.columnNameLowerCase == "createdby"
    || column.columnNameLowerCase == "updatedby"
    || column.columnNameLowerCase == "version"
    || column.columnNameLowerCase == "delflag"
    ><#else>
    /**
     * ${column.columnAlias}
     */
    <#if column.nullable>
    <#assign nullable = "选填项" />
    <#else>
    <#assign nullable = "必填项" />
    </#if>
    <#assign message = "${column.columnAlias}为${nullable}(需控制在${column.size}个字符内)" />
<#if column.isNumberColumn>
    <#if column.nullable == false>
    @NotNull(message = "${message}")
    @Min(value = 1, message = "${message}")
    </#if>
<#elseif column.isDateTimeColumn>
    <#if column.nullable == false>
    @NotNull(message = "${message}")
    </#if>
<#else>
    @Size(<#if column.nullable == false>min = 1,</#if>max = ${column.size}, message = "${message}")
</#if>
    private ${column.simpleJavaType} ${column.columnNameFirstLower};
    </#if>
</#list>

<#--set get方法-->
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase
    || column.columnNameLowerCase == "createdtime"
    || column.columnNameLowerCase == "updatedtime"
    || column.columnNameLowerCase == "createdby"
    || column.columnNameLowerCase == "updatedby"
    || column.columnNameLowerCase == "delflag"
    || column.columnNameLowerCase == "version"
    ><#else>

    public void set${column.columnName} (${column.simpleJavaType} ${column.columnNameFirstLower}){
        this.${column.columnNameFirstLower} = ${column.columnNameFirstLower};
    }
    public ${column.simpleJavaType} get${column.columnName}(){
        return this.${column.columnNameFirstLower};
    }
    </#if>
</#list>

    @Override
    public String toString(){
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("${className} [");
        <#list table.columns as column>
        <#if column_index != 0>
        stringBuffer.append(", ");
        </#if>
        <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase>
        stringBuffer.append("id = ").append(super.getId());
        <#elseif column.columnNameLowerCase == "delflag">
        stringBuffer.append("delFlag = ").append(super.getDelFlag());
        <#elseif column.columnNameLowerCase == "createdtime">
        stringBuffer.append("createdTime = ").append(super.getCreatedTime());
        <#elseif column.columnNameLowerCase == "updatedtime">
        stringBuffer.append("updatedTime = ").append(super.getUpdatedTime());
        <#elseif column.columnNameLowerCase == "createdby">
        stringBuffer.append("createdBy = ").append(super.getCreatedBy());
        <#elseif column.columnNameLowerCase == "updatedby">
        stringBuffer.append("updatedBy = ").append(super.getUpdatedBy());
        <#elseif column.columnNameLowerCase == "version">
        stringBuffer.append("version = ").append(super.getVersion());
        <#else>
        stringBuffer.append("${column.columnNameFirstLower} = ").append(this.get${column.columnName}());
        </#if>
        </#list>
        stringBuffer.append("]");
        return stringBuffer.toString();
    }
}