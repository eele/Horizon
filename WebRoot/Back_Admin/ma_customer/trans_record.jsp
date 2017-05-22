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
	<link href="/Horizon/Back_Admin/css/per_info.css" rel="stylesheet"
		type="text/css">
	<script type="text/javascript" src="/Horizon/jQuery/jquery1.42.min.js"></script>
    <script type="text/javascript" src="/Horizon/Back_Admin/js/trans_record.js"></script>
</head>

<body>
	<div style="height:40px" align="center">
		搜索顾客登录名：
		<input type="text" id="searchUser" style="width:300px">&nbsp;&nbsp;
		<input type="button" value="搜索" 
		onClick="location.href='/Horizon/ma_customer/CustomerManagementCtrl?method=getUserList&currentPage=1&keyword='+$('#searchUser').val()">
	</div>
	<table width="100%" class="imagetable" cellspacing="0" cellpadding="0">
		<tr>
			<th width="200">顾客登录名</th>
			<th>下单次数</th>
			<th>最近下单时间</th>
			<th>最近90天消费金额</th>
			<th colspan="2">操作</th>
		</tr>
		<c:forEach items="${pb.bean }" var="tr_record">
			<tr align="center">
				<td>${tr_record.loginname }</td>
				<td>${tr_record.orderNum }</td>
				<td>${tr_record.ordertime }</td>
				<td>${tr_record.price }</td>
				<td width="75"><a href="javascript:')">查看详情</a></td>
			</tr>
		</c:forEach>
	</table>

	<!--分页 -->
	<div class="pager" align="right">
		<c:if test="${pb.currentPage<=1 }">
			<div style="position: relative;font-size:20px;font-weight:900;width:30px;height:30px;float:left;left:45%" align="center">--</div>
		</c:if>
		<c:if test="${pb.currentPage>1 }">
			<div style="position: relative;font-size:20px;font-weight:900;width:30px;height:30px;float:left;left:45%" align="center"><a href="${pb.url }&currentPage=${pb.currentPage-1}"><span>&laquo;</span> </a></div>
		</c:if>

		<c:forEach begin="${pb.currentPage-5>0?pb.currentPage-5:1}"
			end="${pb.currentPage + 4 > pb.totalPage ? pb.totalPage : pb.currentPage + 4 }" var="i">
			<div style="position: relative;font-size:20px;font-weight:900;width:30px;height:30px;float:left;left:50%" align="center"><a href="${pb.url }&currentPage=${i }">${i}</a></div>
		</c:forEach>

		<c:if test="${pb.currentPage>=pb.totalPage }">
			<div style="position: relative;font-size:20px;font-weight:900;width:30px;height:30px;float:left;left:55%" align="center">--</div>
		</c:if>
		<c:if test="${pb.currentPage<pb.totalPage }">
			<div style="position: relative;font-size:20px;font-weight:900;width:30px;height:30px;float:left;left:55%" align="center">
				<a href="${pb.url }&currentPage=${pb.currentPage+1}"> <span>&raquo;</span> </a>
			</div>
		</c:if>
		<div style="position: relative;font-size:20px;font-weight:900;height:30px;float:left;left:60%" align="center">共${pb.totalPage}页，第${pb.currentPage}页</div>
	</div>
	<!-- 分页结束  -->
</body>
</html>
