<#include "/basic/macro.include"/>
#parse("layouts/var-pre.view")
#set($page_title="${table.remarks}列表")
#set($result = $_model_.result)
#set($totalSize = $result["K_TOTAL_DATA_SIZE"])
#set($startRow = $result["K_START_ROW"])
#set($endRow = $result["K_END_ROW"])
#set($dataSize = $result["K_DATA_SIZE"])
#set($K_PAGE_NUM = $result['K_PAGE_NUM'])
#set($totalPage = $result['K_TOTAL_PAGE_NUM'])

#set($menuURI="$!{basePath}${classNameLower}/list")
#set($crumbs="我的工作台:$!{basePath}index,$page_title")
<!-- DataTables CSS -->
<link href="$!{basePath}css/plugins/dataTables.bootstrap.css" rel="stylesheet"/>

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">#printCrumbs($crumbs)</h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        #if($!{result["_message_"]})
        <div class="alert alert-success">
            <i class="fa fa-check"></i>&nbsp; $!{result["_message_"]}
        </div>
        #end
        <div class="panel panel-default">
            <form id="queryForm" class="form-inline" method="post" action="$!{basePath}${classNameLower}/list">
                <div class="panel-body">
                    <input type="hidden" id="pageNumField" name="K_PAGE_NUM" value="$!{K_PAGE_NUM}"/>
                    <div class="search-item-container">
                        <!--Search Items -->
                <#list table.columns as column>
                    <#if column.nullable == false && column.columnNameLowerCase != "delflag"
                            && column.columnNameLowerCase != "createtime" && column.columnNameLowerCase != "updatetime">
                        <div class="form-group">
                            <label>${column.columnAlias}</label>
                            <label class="input-inline">
                                <input class="form-control" type="input" name="${column.columnNameFirstLower}" value="$!{result.${column.columnNameFirstLower}}">
                            </label>
                        </div>
                    </#if>
                </#list>
                    </div>
                    <div class="search-button-container">
                        <button type="button" class="btn btn-link search-control-btn">隐藏搜索</button>
                    <#if support_Shiro == "true">
                        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:create")})
                        <a href="$!{basePath}${classNameLower}/add?K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-link">添加记录</a>
                        #end
                    <#else>
                        <a href="$!{basePath}${classNameLower}/add?K_PAGE_NUM=$!{K_PAGE_NUM}" class="btn btn-link">添加记录</a>
                    </#if>
                        <button type="submit" class="btn btn-primary search-btn">开始搜索</button>
                        <button type="reset" class="btn btn-default search-btn">重置条件</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="list-dataTables">
                <thead>
                <tr>
                    <th>#</th>
        <#list table.columns as column>
            <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
                <#if column.columnNameLowerCase == "createtime">
                    <th>创建时间</th>
                <#elseif column.columnNameLowerCase == "updatetime">
                    <th>更新时间</th>
                <#else>
                    <th>${column.columnAlias}</th>
                </#if>
            </#if>
        </#list>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                #if($totalSize gt 0)
                #foreach($obj in $result['K_PAGE_DATA'])
                <tr class="#if($!{velocityCount} % 2 == 0) odd #else even #end">
                    <td>$!{velocityCount}</td>
            <#list table.columns as column>
                <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
                    <td>#if( "$!{obj.${column.columnNameFirstLower}}" == "")--#else$!{obj.${column.columnNameFirstLower}}#end</td>
                </#if>
            </#list>
                    <td class="center">
                        <a href="$!{basePath}${classNameLower}/show?id=$!{obj.id}&K_PAGE_NUM=$!{K_PAGE_NUM}">详情</a>&nbsp;
                    <#if support_Shiro == "true">
                        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:update")})
                        <a href="$!{basePath}${classNameLower}/toupdate?id=$!{obj.id}&K_PAGE_NUM=$!{K_PAGE_NUM}">编辑</a>&nbsp;
                        #end
                    <#else>
                        <a href="$!{basePath}${classNameLower}/toupdate?id=$!{obj.id}&K_PAGE_NUM=$!{K_PAGE_NUM}">编辑</a>&nbsp;
                    </#if>
                    <#if support_Shiro == "true">
                        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:delete")})
                        <a href="#" data-id="$!{obj.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal">删除</a>
                        #end
                    <#else>
                        <a href="#" data-id="$!{obj.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal">删除</a>
                    </#if>
                    </td>
                </tr>
                #end
                #else
                <tr class="even">
                    <td colspan="${table.columns?size}" class="center"><i class="fa fa-info-circle" /> 暂无数据</td>
                </tr>
                #end
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- /.row -->
#printPagination($totalSize, $totalPage, $!{K_PAGE_NUM}, $startRow, $endRow)
#parse("common/delWarnModal.view")