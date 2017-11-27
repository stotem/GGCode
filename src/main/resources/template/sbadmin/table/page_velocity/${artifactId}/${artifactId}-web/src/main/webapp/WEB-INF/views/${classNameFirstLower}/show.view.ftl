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
#if( "$!{_model_.delflag}" == "2")
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <i class="fa fa-warning"></i>&nbsp;数据已被删除
        </div>
    </div>
</div>
#end
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                #$!{_model_.id}
            </div>
            <div class="panel-body">
        <#list table.columns as column>
            <#if column.columnNameLowerCase != table.pkColumn.columnNameLowerCase
                && column.columnNameLowerCase != "version"
                && column.columnNameLowerCase != "delflag">
                <div class="form-group">
                <#if column.columnNameLowerCase == "createdtime">
                    <label>创建时间</label>
                <#elseif column.columnNameLowerCase == "updatedtime">
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
                #if( "$!{_model_.delflag}" != "2")
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:update")})
                <a href="$!{basePath}${classNameLower}/toupdate?id=$!{_model_.id}&K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-warning">修改记录</a>
                #end
            <#else>
                <a href="$!{basePath}${classNameLower}/toupdate?id=$!{_model_.id}&K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-warning">修改记录</a>
            </#if>
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:delete")})
                <a href="#" data-id="$!{_model_.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal" class="btn btn-danger">删除记录</a>
                #end
            <#else>
                <a href="#" data-id="$!{_model_.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal" class="btn btn-danger">删除记录</a>
            </#if>
                #end
            <#if support_Shiro == "true">
                #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:create")})
                <a href="$!{basePath}${classNameLower}/add?K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-link">新记录</a>
                #end
                <#else>
                <a href="$!{basePath}${classNameLower}/add?K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-link">新记录</a>
            </#if>
                <a href="$menuURI?K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-link">返回列表</a>
            </div>
        </div>
    </div>
</div>
#parse("common/delWarnModal.view")