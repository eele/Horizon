<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Horizon店铺首页</title>

    <link href="/Horizon/Back_Shop/css/main.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/Horizon/jQuery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/Horizon/Back_Shop/js/main.js"></script>
</head>
  
  <body>
  <div class="topBar">帐号区</div>
  
  <div class="bodyArea">
	<div class="mallTitle">
	  <img id="imgTitle" src="/Horizon/Back_Shop/img/mallTitle.png" alt="Horizon店铺管理">
	</div>
	<div align="left" class="tabBar">
	  <div id="tab1" class="tabStyle">店铺信息</div>
	  <div id="tab2" class="tabStyle" style="margin-left:105px">商品管理</div>
	  <div id="tab3" class="tabStyle" style="margin-left:210px">订单管理</div>
	  <div class="shopName">xx店铺</div>
	</div>
    <div class="mainArea"></div>
  </div>
  </body>
</html>
