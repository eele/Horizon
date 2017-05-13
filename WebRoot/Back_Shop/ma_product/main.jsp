<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="stylesheet" type="css/product/main.css">
  </head>
  
  <body>
<table class="table" align="center" width="100%" height="100%" border="0">
	<tr style="height: 120px; ">
		<td align="center" width="200px;">
			<iframe frameborder="0" src="/LittleMall/category/findCategoryAllCtrl" name="left"></iframe>
		</td>
		<td>
			<iframe frameborder="0" src="<c:url value='/adminjsps/admin/product/body.jsp'/>" name="body"></iframe>
		</td>
	</tr>
</table>
  </body>
</html>
