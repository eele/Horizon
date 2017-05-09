<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店铺首页</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link href="css/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <div class="topBar">帐号区</div>
  <div>
    <div align="center" class="shopTitle">我的店铺 · xxx店</div>
  </div>
  <div class="tabBar">功能标签栏</div>
  <div class="list">列表</div>
  <div class="commodityArea">商品区</div>
  </body>
</html>
