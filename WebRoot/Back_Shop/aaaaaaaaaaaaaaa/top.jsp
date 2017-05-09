<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
<style type="text/css">
	body {font-size: 10pt;}
	a {color: #fff;}
</style>
  </head>
  
  <body style="background: rgb(8,8,130);color: #fff;">
<h1 style="text-align: center; line-height: 30px;">我的店铺 · xx店</h1>
<div style="line-height: 10px;">
	<span>管理员：${sessionScope.admin.adminname }</span>
	<a target="_top" href="<c:url value='/adminjsps/login.jsp'/>">退出</a>
	<span style="padding-left:50px;">
		<a href="ma_shopInfo/info.jsp">店铺信息</a>
		<a href="ma_product/main.jsp">商品管理</a>
		<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单管理</a>
	</span>
</div>
  </body>
</html>
