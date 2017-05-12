<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>运营管理后台</title>

    <link href="/Horizon/Back_Admin/css/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  	<div class="top">
		此处显示  class "top" 的内容
		<div class="tabBar">此处显示  class "tabBar" 的内容</div>
	</div>
  </body>
</html>
