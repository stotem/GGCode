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
                新记录
            </div>
            <div class="panel-body">
                <form action="$!{basePath}${classNameLower}/save" method="post">
                    <input type="hidden" name="K_PAGE_NUM" value="$!{K_PAGE_NUM}"/>
                    <input type="hidden" class="form-stay-flag" name="stay"/>
            <#list table.columns as column>
                <#if column.columnNameLowerCase != "delflag"
                    && column.columnNameLowerCase != "createdtime"
                    && column.columnNameLowerCase != "updatedtime"
                    && column.columnNameLowerCase != "version"
                    && column.columnNameLowerCase != table.pkColumn.columnNameLowerCase>
                    <div class="form-group">
                        <label><#if column.nullable><#else> * </#if>${column.columnAlias}</label>
                        <input class="form-control" name="${column.columnNameFirstLower}"/>
                        <p class="help-block">${column.columnAlias}需控制在${column.size}个字符内</p>
                    </div>
                </#if>
            </#list>
                    <button type="submit" class="btn btn-success">保存并返回</button>
                    <button type="submit" class="btn form-btn-stay btn-primary">保存</button>
                    <button type="reset" class="btn btn-default">重填</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $("button[type=submit]").click(function(){
            $(".form-stay-flag").val($(this).hasClass("form-btn-stay"));
        });
    })
</script>