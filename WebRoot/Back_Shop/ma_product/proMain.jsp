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

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link href="/Horizon/Back_Shop/css/proMain.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/Horizon/jQuery/jquery1.42.min.js"></script>
	<script type="text/javascript" src="/Horizon/Back_Shop/js/proMain.js"></script>
</head>
  
  <body>
	<div class="list">
		<div align="center" class="listCategory">商品分类</div>
		<div class="listContent"></div>
	</div>
	<div align="center" class="commodityArea">
	  <div class="mallTitle">
		  <div class="searchArea">
			<div class="searchBox">
			  <div class="searchSelect" style="left:0px;">商品</div>
			  <input name="inputBox" type="text" class="searchInput">
			  <div class="searchButton">
				<img src="/Horizon/Back_Shop/img/searchButton.png" alt="搜索" width="26" height="26">
			  </div>
			</div>
		  </div>
	  </div>
		商品区
	</div>
  </body>
</html>
