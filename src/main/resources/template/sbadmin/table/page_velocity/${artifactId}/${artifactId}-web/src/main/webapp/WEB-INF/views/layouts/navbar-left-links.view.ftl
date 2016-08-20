<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="搜索...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                </div>
                <!-- /input-group -->
            </li>
            <li>
                <a class="active" href="$!{basePath}views/index"><i class="fa fa-dashboard fa-fw"></i> 我的工作台</a>
            </li>
            <li>
                <a class="nav-first-level" href="javascript:void(0)"><i class="fa fa-table fa-fw"></i> ${artifactId}<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                <#list gg_table_name_list?split(",") as tmpTableInfo>
                <#assign tableInfo=tmpTableInfo?split(":") />
                    <li>
                    <a href="$!{basePath}${tableInfo[1]}/list">${tableInfo[0]}</a>
                    </li>
                </#list>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
<script>
    $(function(){
        #if($!{menuURI})
        var pathname = "$!{menuURI}";
        #else
        var pathname = $(window.location).prop("pathname");
        #end
        var find = false; // 找到菜单节点标识,以第一个为准
        $("#side-menu a").each(function(){
            if (!find && $(this).prop("href").indexOf(pathname) > -1) {
                $(this).addClass("active");
                var item = $(this).parents(".nav-second-level").prev();
                while(item.hasClass("nav-first-level")) {
                    item.click();
                    item = item.parents(".nav-second-level").prev();
                }
                find = true;
            }
            else {
                $(this).removeClass("active");
            }
        });
    });
</script>