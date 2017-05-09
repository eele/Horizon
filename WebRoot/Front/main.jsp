<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Horizon商城</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link href="/Horizon/Front/css/main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/Horizon/jQuery//jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/Horizon/Front/js/main.js"></script>
</head>
  
  <body onLoad="load()">
  <div class="topBar">帐号区</div>
  
  <div class="bodyArea">
	<div class="list">
		<div align="right" class="mallTitle">
		  <img src="/Horizon/Front/img/mallTitle.PNG" alt="Horizon购物商城" width="173" height="72">
		</div>
	</div>
	<div align="center" class="commodityArea">
	  <div class="mallTitle">
		  <div class="searchArea">
			<div class="searchBox">
			  <div class="searchSelect" style="left:0px;" id="select1">店铺</div>
			  <div class="searchSelect" style="left:56px;" id="select2">商品</div>
			  <input name="inputBox" type="text" class="searchInput">
			  <div class="searchButton">
				<img src="/Horizon/Front/img/searchButton.png" alt="搜索" width="26" height="26">
			  </div>
			</div>
		  </div>
	  </div>
		商品区
	</div>
  </div>
  </body>
</html>
