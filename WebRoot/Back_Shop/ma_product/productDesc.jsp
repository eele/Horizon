<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>${product.productName}</title>
    
    <link href="/Horizon/Back_Shop/css/productDesc.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="/jquery/jquery.datepick.css">
	<script type="text/javascript" src="/jquery/jquery.datepick.js"></script>
	<script type="text/javascript" src="/jquery/jquery.datepick-zh-CN.js"></script>
	<script type="text/javascript" src="/adminjsps/admin/js/book/desc.js"></script>
	<script type="text/javascript" src="/Horizon/jQuery/jquery1.42.min.js"></script>
    <script type="text/javascript" src="/Horizon/Back_Shop/js/productDesc.js"></script>
    
	<script type="text/javascript">
	$(function() {
		$("#box").attr("checked", false);
		$("#formDiv").css("display", "none");
		$("#show").css("display", "");	
		
		// 操作和显示切换
		$("#box").click(function() {
			if($(this).attr("checked")) {
				$("#show").css("display", "none");
				$("#formDiv").css("display", "");
			} else {
				$("#formDiv").css("display", "none");
				$("#show").css("display", "");		
			}
		});
	});
	
	function loadChildren() {
		/*
		1. 获取pid
		2. 发出异步请求，功能之：
		  3. 得到一个数组
		  4. 获取cid元素(<select>)，把内部的<option>全部删除
		  5. 添加一个头（<option>请选择2级分类</option>）
		  6. 循环数组，把数组中每个对象转换成一个<option>添加到cid中
		*/
		// 1. 获取pid
		var pid = $("#pid").val();
		// 2. 发送异步请求
		$.ajax({
			async:true,
			cache:false,
			url:"/goods/admin/AdminProServlet",
			data:{method:"ajaxFindChildren", pid:pid},
			type:"POST",
			dataType:"json",
			success:function(arr) {
				// 3. 得到cid，删除它的内容
				$("#cid").empty();//删除元素的子元素
				$("#cid").append($("<option>====请选择2级分类====</option>"));//4.添加头
				// 5. 循环遍历数组，把每个对象转换成<option>添加到cid中
				for(var i = 0; i < arr.length; i++) {
					var option = $("<option>").val(arr[i].cid).text(arr[i].cname);
					$("#cid").append(option);
				}
			}
		});
	}
	
	/*
	 * 点击编辑按钮时执行本函数
	 */
	function editForm() {
		$("#method").val("edit");
		$("#form").submit();
	}
	/*
	 * 点击删除按钮时执行本函数
	 */
	 function deleteForm() {
		$("#method").val("delete");
		$("#form").submit();	
	}
	
	</script>
</head>
  
  <body>
  <div class="topBar">帐号区</div>
  
  <div class="bodyArea">
	<div class="mallTitle">
	  <img id="imgTitle" src="/Horizon/Back_Shop/img/mallTitle.png" alt="Horizon店铺管理">
	</div>
	<div align="left" class="tabBar">
	  <div class="shopName">商品详情</div>
	</div>
    <div class="mainArea">
	      <input type="checkbox" id="box"><label for="box">编辑或删除</label>
	    <br/>
	    <br/>
	  <div id="show">
	    <div class="sm">${product.productName }</div>
	    <img align="top" src="${product.image_w }" class="tp"/>
	    <div id="book" style="float:left;">
		    <ul class="ulStyle">
		    	<li class="liStyle" >商品编号：${product.productid }</li>
		    	<li class="liStyle" >促销价：<span class="price_n">&yen;${product.currPrice }</span></li>
		    	<li class="liStyle" >定价：<span style="text-decoration:line-through;">&yen;${product.price }</span></li>
		    </ul>
			<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
			<table class="tab">
				<tr>
					<td colspan="3">品牌：</td>
				</tr>
				<tr>
					<td colspan="3">数量：</td>
				</tr>
				<tr>
					<td colspan="3">生产日期：</td>
				</tr>
				<tr>
					<td colspan="3">进货日期：</td>
				</tr>
				<tr>
					<td colspan="3">商品说明：</td>
				</tr>
			</table>
		</div>
	  </div>
	  
	  <div id='formDiv'>
	   <div class="sm">&nbsp;</div>
	   <form action="/admin/AdminProServlet'/>" method="post" id="form">
	    <input type="hidden" name="method" id="method"/>
	   	<input type="hidden" name="bid" value="${product.productid }"/>
	    <img align="top" src="${product.image_w }'/>" class="tp"/>
	    <div style="float:left;">
		    <ul class="ulStyle">
		    	<li class="liStyle" >商品编号：${product.bid }</li>
		    	<li class="liStyle" >商品名：　<input id="productName" type="text" name="productName" value="${product.productName }" style="width:500px;"/></li>
		    	<li class="liStyle" >促销价：<input id="currPrice" type="text" name="currPrice" value="${product.currPrice }" style="width:50px;"/></li>
		    	<li class="liStyle" >定价：　<input id="price" type="text" name="price" value="${product.price }" style="width:50px;"/>
		    </ul>
			<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
			<table class="tab">
				<tr>
					<td colspan="3">
						品牌：　　<input id="author" type="text" name="author" value="${product.author }" style="width:150px;"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						出版社：　<input id="press" type="text" name="press" value="${product.press }" style="width:200px;"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">出版时间：<input id="proDate" type="text" name="proDate" value="${product.proDate }" style="width:100px;"/></td>
				</tr>
				<tr>
					<td>版次：　　<input id="edition" type="text" name="edition" value="${product.edition }" style="width:40px;"/></td>
					<td>页数：　　<input id="pageNum" type="text" name="pageNum" value="${product.pageNum }" style="width:50px;"/></td>
					<td>字数：　　<input id="wordNum" type="text" name="wordNum" value="${product.wordNum }" style="width:80px;"/></td>
				</tr>
				<tr>
					<td width="250px">印刷时间：<input id="printtime" type="text" name="printtime" value="${product.printtime }" style="width:100px;"/></td>
					<td width="250px">开本：　　<input id="booksize" type="text" name="productsize" value="${product.booksize }" style="width:30px;"/></td>
					<td>纸张：　　<input id="paper" type="text" name="paper" value="${product.paper }" style="width:80px;"/></td>
				</tr>
				<tr>
					<td>
						一级分类：<select name="pid" id="pid" onchange="loadChildren()">
							<option value="">==请选择1级分类==</option>
	<c:forEach items="${parents }" var="parent">
	  <option value="${parent.cid }" <c:if test="${product.category.parent.cid eq parent.cid }">selected="selected"</c:if>>${parent.cname }</option>
	</c:forEach>
						</select>
					</td>
					<td>
						二级分类：<select name="cid" id="cid">
							<option value="">==请选择2级分类==</option>
	<c:forEach items="${children }" var="child">
	  <option value="${child.cid }" <c:if test="${product.category.cid eq child.cid }">selected="selected"</c:if>>${child.cname }</option>
	</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<input onclick="editForm()" type="button" name="method" id="editBtn" class="btn" value="编　　辑">
						<input onclick="deleteForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	   </form>
	  </div>
    </div>
  </div>
  </body>
</html>
