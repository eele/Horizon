<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<link href="/Horizon/Back_Admin/css/per_info.css" rel="stylesheet" type="text/css">
</head>

<body>
	<table width="100%" class="imagetable">
		<tr>
			<th width="211">顾客ID</th>
			<th>登录名</th>
			<th>E-Mail</th>
			<th>手机号码</th>
			<th colspan="2">操作</th>
		</tr>
		<c:forEach items="${pb.bean }" var="user">
		<tr align="center">
			<td>${user.uid }</td>
			<td>${user.loginname }</td>
			<td>${user.email }</td>
			<td>${user.phone }</td>
			<td width="100">重置密码</td>
		    <td width="75">删除</td>
		</tr>
		</c:forEach>
	</table>

	<!--分页 -->
	<div style="width:380px;margin:0 auto;margin-top:50px;">
		<ul class="pagination" style="text-align:center; margin-top:10px;">
			<c:if test="${pb.currentPage<=1 }">
				<li class="disabled"><a href="#" aria-label="Previous"><span>&laquo;</span> </a></li>
			</c:if>
			<c:if test="${pb.currentPage>1 }">
				<li><a
					href="${pb.url }&currentPage=${pb.currentPage-1}"
					aria-label="Previous"><span aria-hidden="true">&laquo;</span> </a>
				</li>
			</c:if>

			<!-- <li class="active"><a href="#">1</a></li> -->
			<c:forEach begin="${pb.currentPage-5>0?pb.currentPage-5:1}"
				end = "${pb.currentPage + 4 > pb.totalPage ? pb.totalPage : pb.currentPage + 4 }" var="i">
                    <li><a
					href="${pb.url }&currentPage=${i }">${i}</a></li>
			</c:forEach>

			<c:if test="${pb.currentPage>=pb.totalPage }">
				<li class="disabled"><a href="#" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span> </a>
				</li>
			</c:if>
			<c:if test="${pb.currentPage<pb.totalPage }">
				<li><a
					href="${pb.url }&currentPage=${pb.currentPage+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 分页结束  -->
</body>
</html>
