<#include "/basic/macro.include"/>
#parse("layouts/var-pre.view")
#set($page_title="${table.remarks}添加")
#set($menuURI="$!{basePath}${classNameLower}/list")
#set($crumbs="我的工作台:$!{basePath}index,${table.remarks}列表:$menuURI,$page_title")
<div class="row">
    <div class="col-lg-12">
        <h4 class="page-header">#printCrumbs($crumbs)</h4>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                新记录
            </div>
            <div class="panel-body">
                <form action="$!{basePath}${classNameLower}/save" method="post">
            <#list table.columns as column>
                <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != "createtime" &&
                     column.columnNameLowerCase != "updatetime" && column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
                    <div class="form-group">
                        <label>${column.columnAlias}</label>
                        <input class="form-control" name="${column.columnNameFirstLower}" placeholder="${column.columnAlias}"/>
                        <p class="help-block"><#if column.nullable>选填<#else>必填</#if>(需控制在${column.size}个字符内),${column.columnAlias}</p>
                    </div>
                </#if>
            </#list>
                    <button type="submit" class="btn btn-default">保存</button>
                    <button type="reset" class="btn btn-default">重填</button>
                </form>
            </div>
        </div>
    </div>
</div>
