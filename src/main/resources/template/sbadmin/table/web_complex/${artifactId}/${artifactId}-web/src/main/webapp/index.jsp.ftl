<%@ page contentType="text/html;charset=UTF-8" %>
<#if spring_viewresolver?lower_case?trim == 'jsp'>
<html>
<head>
    <title>${groupId} - ${artifactId}</title>
</head>
<body>
    <b>This is index.jsp</b>
</body>
</html>
<#else>
<jsp:forward page="/redirectIndex" />
</#if>