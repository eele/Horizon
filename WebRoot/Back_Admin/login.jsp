<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>

	<!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="/Horizon/Back_Admin/css/reset.css">
    <link rel="stylesheet" href="/Horizon/Back_Admin/css/supersized.css">
    <link rel="stylesheet" href="/Horizon/Back_Admin/css/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>
  
  <body>
    <div class="page-container">
        <h1>Horizon购物商城</h1>
        <form action="" method="post">
            <input type="text" name="username" class="username" placeholder="Username">
            <input type="password" name="password" class="password" placeholder="Password">
            <button type="submit">登录</button>
            <div class="error"><span>+</span></div>
        </form>
    </div>
    
    <!-- Javascript -->
    <script src="/Horizon/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/Horizon/Back_Admin/js/supersized.3.2.7.min.js"></script>
    <script src="/Horizon/Back_Admin/js/supersized-init.js"></script>
    <script src="/Horizon/Back_Admin/js/scripts.js"></script>
  </body>
</html>
