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
	<link rel="stylesheet" type="text/css" href="/Horizon/Back_Admin/css/login.css"/>
  </head>
  
<body>
<div class="logo">
	<img src="/Horizon/Front/img/mallTitle.PNG" width="173" height="72" alt="Horizon购物商城">
</div>
<div class="loginArea">
	<div id="login">  
	<h1>运营商管理平台</h1><br><br>
	<form method="post">  
		<input type="text" required oninvalid="setCustomValidity('请输入用户名')" oninput="setCustomValidity('')" placeholder="用户名" name="u"></input>  
		<input type="password" required oninvalid="setCustomValidity('请输入密码')" oninput="setCustomValidity('')" placeholder="密码" name="p"></input>  
		<button class="but" type="submit">登录</button>  
	</form>  
	</div>  
</div>
</body>  
</html>
