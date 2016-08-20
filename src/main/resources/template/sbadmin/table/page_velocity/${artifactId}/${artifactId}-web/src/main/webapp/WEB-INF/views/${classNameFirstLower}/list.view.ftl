<#include "/basic/macro.include"/>
#parse("layouts/var-pre.view")
#set($page_title="${table.remarks}列表")
#set($result = $_model_.result)
#set($totalSize = $result["K_TOTAL_DATA_SIZE"])
#set($startRow = $result["K_START_ROW"])
#set($endRow = $result["K_END_ROW"])
#set($dataSize = $result["K_DATA_SIZE"])
#set($pageNum = $result['K_PAGE_NUM'])
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
        <form id="queryForm" method="post" action="$!{basePath}${classNameLower}/list">
            <input type="hidden" id="pageNumField" name="K_PAGE_NUM" value="$pageNum"/>
        </form>
        <#if support_Shiro == "true">
        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:create")})
        <a href="$!{basePath}views/${classNameLower}/add" class="btn btn-default">添加记录</a>
        #end
        <#else>
        <a href="$!{basePath}views/${classNameLower}/add" class="btn btn-default">添加记录</a>
        </#if>
        <br />
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
                    <td>$!{obj.${column.columnNameFirstLower}}</td>
                </#if>
            </#list>
                    <td class="center">
                        <a href="$!{basePath}${classNameLower}/show?id=$!{obj.id}&pageNum=$!{pageNum}">详情</a>&nbsp;
                    <#if support_Shiro == "true">
                        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:update")})
                        <a href="$!{basePath}${classNameLower}/toupdate?id=$!{obj.id}&pageNum=$!{pageNum}">编辑</a>&nbsp;
                        #end
                    <#else>
                        <a href="$!{basePath}${classNameLower}/toupdate?id=$!{obj.id}&pageNum=$!{pageNum}">编辑</a>&nbsp;
                    </#if>
                    <#if support_Shiro == "true">
                        #if($!{shiro.hasPermission("${artifactId}:${classNameLower}:delete")})
                        <a href="javascript:void(0)" data-id="$!{obj.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal">删除</a>
                        #end
                    <#else>
                        <a href="javascript:void(0)" data-id="$!{obj.id}" data-action="$!{basePath}${classNameLower}/del" data-toggle="modal" data-target="#delWarnModal">删除</a>
                    </#if>
                    </td>
                </tr>
                #end
                #else
                <tr class="even">
                    <td colspan="${table.columns?size}" class="center">暂无数据</td>
                </tr>
                #end
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- /.row -->
#printPagination($totalSize, $totalPage, $pageNum, $startRow, $endRow)

<div class="modal fade" id="delWarnModal" tabindex="-1" role="dialog" aria-labelledby="delWarnModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="delWarnModalLabel">删除确认</h4>
            </div>
            <div class="modal-body">
                您正在执行数据删除操作,删除后将不可恢复,请谨慎操作,是否继续?
            </div>
            <div class="modal-footer">
                <form id="delWarnModalForm" action="$!{basePath}${classNameLower}/del" method="post">
                    <input type="hidden" name="id"/>
                    <input type="hidden" name="K_PAGE_NUM" value="$pageNum"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">继续</button>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script>
    $("a[data-target=#delWarnModal]").click(function(){
        var id = $(this).attr("data-id");
        console.log(id);
        $("#delWarnModal").find("input[name=id]").val(id);
    });
</script>