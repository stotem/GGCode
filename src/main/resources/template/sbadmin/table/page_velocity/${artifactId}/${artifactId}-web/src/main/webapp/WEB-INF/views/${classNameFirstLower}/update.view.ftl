<#include "/basic/macro.include"/>
#parse("layouts/var-pre.view")
#set($page_title="${table.remarks}编辑")
#set($menuURI="$!{basePath}${classNameLower}/list")
#set($crumbs="我的工作台:$!{basePath}index,${table.remarks}列表:$menuURI,$page_title")
<div class="row">
    <div class="col-lg-12">
        <h4 class="page-header">#printCrumbs($crumbs)</h4>
    </div>
    <!-- /.col-lg-12 -->
</div>
#if($!{_message_})
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <i class="fa fa-check"></i>&nbsp; $!{_message_}
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
                <form action="$!{basePath}${classNameLower}/update" method="post">
                    <input type="hidden" name="id" value="$!{_model_.id}"/>
                    #if($!{pageNum})
                    <input type="hidden" name="pageNum" value="$!{pageNum}"/>
                    #end
            <#list table.columns as column>
                <#if column.columnNameLowerCase != "delflag" && column.columnNameLowerCase != "createtime" &&
                        column.columnNameLowerCase != "updatetime" && column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
                    <div class="form-group">
                        <label>${column.columnAlias}</label>
                        <input class="form-control" name="${column.columnNameFirstLower}" value="$!{_model_.${column.columnNameFirstLower}}"/>
                        <p class="help-block"><#if column.nullable>选填<#else>必填</#if>(需控制在${column.size}个字符内),${column.columnAlias}</p>
                    </div>
                </#if>
            </#list>
                    <button type="submit" class="btn btn-default">保存</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </form>
            </div>
        </div>
    </div>
</div>
