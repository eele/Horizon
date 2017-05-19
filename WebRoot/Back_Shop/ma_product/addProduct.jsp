<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" type="text/css" href="/Horizon/Back_Shop/css/addProduct.css">
<link rel="stylesheet" type="text/css" href="/Horizon/jQuery/jquery.datepick.css">
<script type="text/javascript" src="/Horizon/jQuery/jquery.datepick.js"></script>
<script type="text/javascript" src="/Horizon/jQuery/jquery.datepick-zh-CN.js"></script>
<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var bname = $("#bname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		
		if(!bname || !currPrice || !price || !discount || !author || !press || !pid || !cid || !image_w || !image_b) {
			alert("请将商品信息填写完整。");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("定价、促销价必须是合法的小数！");
			return false;
		}
		$("#form").submit();
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
	var pid = $("#pid").val();
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

</script>
  </head>
  
  <body>
  <div class="addProMain" align="left">
   <p style="font-weight: 900; color: red;">${msg }</p>
   <form action="<c:url value='/admin/AdminAddProServlet'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul class="addProUl">
	    	<li class="addProLi">商品名：　<input id="bname" type="text" name="bname" value="Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）" style="width:500px;"/></li>
	    	<li class="addProLi">大图：　<input id="image_w" type="file" name="image_w"/></li>
	    	<li class="addProLi">小图：　<input id="image_b" type="file" name="image_b"/></li>
	    	<li class="addProLi">定&nbsp;价：　<input id="currPrice" type="text" name="currPrice" value="40.7" style="width:50px;"/>	元</li>
	    	<li class="addProLi">促销价：　<input id="price" type="text" name="price" value="59.0" style="width:50px;"/>	元</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table>
			<tr>
				<td colspan="3">
					品牌：　<input type="text" id="author" name="author" value="Craig Walls" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					数量：　<input type="text" name="press" id="press" value="人民邮电出版社" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">生产日期：<input type="text" id="publishtime" name="publishtime" value="2013-6-1" style="width:100px;"/></td>
			</tr>
			<tr>
				<td colspan="3">进货日期：<input type="text" id="publishtime" name="publishtime" value="2013-6-1" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>
					一级分类：<select name="pid" id="pid" onchange="loadChildren()">
						<option value="">====请选择1级分类====</option>
<c:forEach items="${parents }" var="parent">
			    		<option value="${parent.cid }">${parent.cname }</option>
</c:forEach>

					</select>
				</td>
				<td>
					二级分类：<select name="cid" id="cid">
						<option value="">====请选择2级分类====</option>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>商品说明：　　<input type="text" name="edition" id="edition" value="1" style="width:40px;"/></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="btn" class="btn" value="确定添加" style="float:left">
					<input type="button" id="btn2" value="取消返回">
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
