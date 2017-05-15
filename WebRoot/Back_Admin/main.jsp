<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Horizon运营商管理平台</title>

    <link href="/Horizon/Back_Admin/css/main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/Horizon/jQuery/jquery1.42.min.js"></script>
    <script type="text/javascript" src="/Horizon/Back_Admin/js/main.js"></script>
  </head>
  
  <body>
  <div class="left">
		<div style="background-color:#354457;height:70px">
			<div style="margin-left:20px"><img src="/Horizon/Back_Admin/img/logo.PNG" alt="Horizon运营商管理平台"></div>
		</div>
		
        <div class="itemTitle" style="margin-top:30px">店铺管理</div>
			<div class="itemStyle">店铺开通审核</div>
			<div class="itemStyle">店铺类别管理</div>
			<div class="itemStyle">商品类别管理</div>
		<div class="itemTitle">顾客管理</div>
			<div class="itemStyle">顾客个人信息</div>
			<div class="itemStyle">顾客交易记录</div>
			<div class="itemStyle">顾客问题反馈</div>
		<div class="itemTitle">个人帐号</div>
			<div class="itemStyle">修改个人密码</div>
  </div>
	
    <div class="topBar">此处显示  class "topBar" 的内容</div>
	<div class="mainArea"></div>
  </body>
</html>
