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
    <!--Screen Content-->
    $!{screen_content}
</div>
<!-- /#wrapper -->
</body>
</html>
