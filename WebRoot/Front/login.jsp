<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Horizon商城-买家登录</title>

<link href="/Horizon/Front/css/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<link href="/Horizon/Front/css/demo.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="/Horizon/jQuery/jquery1.42.min.js"></script>
<script type="text/javascript" src="/Horizon/Front/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="/Horizon/Front/js/Validform_v5.3.2_min.js"></script>
<script>
	$(function() {

		$(".i-text").focus(function() {
			$(this).addClass('h-light');
		});

		$(".i-text").focusout(function() {
			$(this).removeClass('h-light');
		});

		$("#username").focus(function() {
			var username = $(this).val();
			if (username == '输入账号') {
				$(this).val('');
			}
		});

		$("#username").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入账号');
			}
		});

		$("#password").focus(function() {
			var username = $(this).val();
			if (username == '输入密码') {
				$(this).val('');
			}
		});

		$(".registerform").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".error-box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : true
		});

	});
</script>
</head>

<body>
	<div class="header">
		<h1 class="headerLogo">
			<img id="imgTitle" src="/Horizon/Front/img/mallTitle.PNG" alt="Horizon购物商城">
		</h1>
	</div>

	<div class="banner">

		<div class="login-aside">
			<div id="o-box-up"></div>
			<div id="o-box-down" style="table-layout:fixed;">
				<div class="error-box" style="height: 15px;"></div>

				<form class="registerform" action="demo/ajax_post.jsp">
					<div class="fm-item">
						<label for="logonId" class="form-label">用户名：</label> <input
							type="text" value="输入账号" maxlength="100" id="username"
							class="i-text" ajaxurl="demo/valid.jsp" datatype="s6-18"
							errormsg="用户名至少6个字符,最多18个字符！">
						<div class="ui-form-explain"></div>
					</div>

					<div class="fm-item">
						<label for="logonId" class="form-label">密码：</label> <input
							type="password" value="" maxlength="100" id="password"
							class="i-text" datatype="*6-16" nullmsg="请输入密码！"
							errormsg="密码范围在6~16位之间！">
						<div class="ui-form-explain"></div>
					</div>

					<div class="fm-item" style="margin-top: 50px;">
						<label for="logonId" class="form-label"></label> <input
							type="submit" value="" tabindex="4" id="send-btn"
							class="btn-login">
						<div class="ui-form-explain"></div>
					</div>

				</form>

			</div>

		</div>

		<div class="bd">
			<ul>
				<li
					style="background:url(/Horizon/Front/themes/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;">
				</li>
				<li
					style="background:url(/Horizon/Front/themes/theme-pic2.jpg) #BCE0FF center 0 no-repeat;">
				</li>
			</ul>
		</div>

		<div class="hd">
			<ul></ul>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
	</script>


	<div class="banner-shadow"></div>

	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>

</body>
</html>
