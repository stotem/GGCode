<#include "/basic/macro.include"/>
<!DOCTYPE html>
#parse("layouts/var-pre.view")
<html lang="en">

<head>
    #parse("layouts/meta-inf.view")
    <title>${artifactId}</title>
    #parse("layouts/import.view")
</head>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        #parse("layouts/header.view")
        #parse("layouts/navbar-left-links.view")
    </nav>

    <div id="page-wrapper">
    <!--Screen Content-->
    <#if spring_viewresolver == "velocity">
    $!{screen_content}
    </#if>
    </div>
    <!-- /#page-wrapper -->

    <div id="page-footer">
        #parse("layouts/footer.view")
    </div>
    <!-- /#page-footer -->
</div>
<!-- /#wrapper -->

</body>

</html>
