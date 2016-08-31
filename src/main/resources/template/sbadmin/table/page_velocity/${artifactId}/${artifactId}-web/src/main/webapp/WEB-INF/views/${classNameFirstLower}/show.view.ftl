<#include "/basic/macro.include"/>
#parse("layouts/var-pre.view")
#set($page_title="${table.remarks}详情")
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
                #$!{_model_.id}
            </div>
            <div class="panel-body">
        <#list table.columns as column>
            <#if column.columnNameLowerCase != table.pkColumn.columnNameLowerCase && column.columnNameLowerCase != "delflag">
                <div class="form-group">
                <#if column.columnNameLowerCase == "createtime">
                    <label>创建时间</label>
                <#elseif column.columnNameLowerCase == "updatetime">
                    <label>更新时间</label>
                <#else>
                    <label>${column.columnAlias}</label>
                </#if>
                    <p class="help-block">#if( "$!{_model_.${column.columnNameFirstLower}}" == "")--#else$!{_model_.${column.columnNameFirstLower}}#end</p>
                </div>
            </#if>
        </#list>
            </div>
            <div class="panel-footer">
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:create")})
                <a href="$!{basePath}views/${classNameLower}/add" class="btn btn-link">新记录</a>
                #end
            <#else>
                <a href="$!{basePath}views/${classNameLower}/add" class="btn btn-link">新记录</a>
            </#if>
                <a href="$menuURI?K_PAGE_NUM=$!{pageNum}" class="btn btn-link">返回列表</a>
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:update")})
                <a href="$!{basePath}${classNameLower}/toupdate?id=$!{_model_.id}&pageNum=$!{pageNum}" class="btn btn-default">修改记录</a>
                #end
            <#else>
                <a href="$!{basePath}${classNameLower}/toupdate?id=$!{_model_.id}&pageNum=$!{pageNum}" class="btn btn-default">修改记录</a>
            </#if>
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:delete")})
                <a href="javascript:void(0)" data-id="$!{_model_.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal" class="btn btn-default">删除记录</a>
                #end
            <#else>
                <a href="javascript:void(0)" data-id="$!{_model_.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal" class="btn btn-default">删除记录</a>
            </#if>
            </div>
        </div>
    </div>
</div>
#parse("common/delWarnModal.view")