<%@ page pageEncoding="UTF-8" %>
<%@ page import="${groupId}.${artifactId}.common.objects.*" %>
<%@ page import="${groupId}.${artifactId}.common.objects.expt.*" %>
<%
response.setCharacterEncoding("UTF-8");
response.setContentType("application/json;charset=UTF-8");
ServiceException ex = (ServiceException)request.getAttribute("exception");
String exMessage = ex.getMessage();
if (exMessage != null && exMessage.indexOf("dubbo") >= 0) {
    exMessage = "服务器繁忙, 请稍后重试";
}
MapOutput exceptionResp = MapOutput.createFail(Output.CODE_EXCEPTION, exMessage);
exceptionResp.setErrorCode(ex.getErrorCode());
String message = com.alibaba.fastjson.JSON.toJSONString(exceptionResp);
response.getWriter().write(message);
%>