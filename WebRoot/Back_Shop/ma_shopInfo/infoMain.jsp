<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="/Horizon/Back_Shop/css/infoMain.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/Horizon/Back_Shop/js/infoMain.js"></script>
  </head>
  
  <body>
  <div align="center"><h2>店铺信息</h2></div>
  <div align="center" style="height:70px">
  	<div class="infoTop">
  	  <div class="modifyBtn" id="btn1" style="left:1px"><strong>修改信息</strong></div>
	  <div class="modifyBtn" id="btn2" style="left:100px"><strong>取消</strong></div>
  	</div>
  </div>
<table width="719" border="0" align="center">
      <tr>
        <td width="162" align="right">店铺名：</td>
        <td width="10" height="40" align="right">&nbsp;</td>
        <td colspan="2"><input name="shopName" type="text" class="inputText"></td>
      </tr>
      <tr>
        <td align="right">店铺类别：</td>
        <td align="right">&nbsp;</td>
        <td height="40" colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" valign="top">店铺简介：</td>
        <td height="73" align="right" valign="top">&nbsp;</td>
        <td height="70" colspan="2"><textarea name="desc" class="desc"></textarea></td>
      </tr>
      <tr>
        <td height="30" rowspan="2" align="right">主要货源：</td>
        <td height="30" rowspan="2" align="right">&nbsp;</td>
        <td height="30"><input type="radio" name="proSrc" value="radiobutton">
        	线下批发市场</td>
        <td height="30"><input type="radio" name="proSrc" value="radiobutton">
			实体店拿货</td>
      </tr>
      <tr>
        <td height="30"><input type="radio" name="proSrc" value="radiobutton">
			自己生产</td>
        <td height="30"><input type="radio" name="proSrc" value="radiobutton">
			代工生产</td>
      </tr>
      <tr>
        <td align="right">是否有实体店：</td>
        <td height="40" align="right">&nbsp;</td>
        <td width="138" height="40"><input type="radio" name="phy" value="radiobutton">
        是</td>
        <td width="391" height="40"><input type="radio" name="phy" value="radiobutton">
        否</td>
      </tr>
      <tr>
        <td align="right">是否有工厂或仓库：</td>
        <td height="40" align="right">&nbsp;</td>
        <td width="138" height="40"><input type="radio" name="fac" value="radiobutton">
        是</td>
        <td width="391" height="40"><input type="radio" name="fac" value="radiobutton">
        否</td>
      </tr>
	   <tr>
	     <td width="162" align="right">联系人：</td>
	     <td width="10" height="40" align="right">&nbsp;</td>
        <td height="40" colspan="2"><input name="seller" type="text" class="inputText"></td>
      </tr>
	   <tr>
	     <td width="162" align="right">电话号码：</td>
	     <td width="10" height="40" align="right">&nbsp;</td>
        <td height="40" colspan="2"><input name="telNumber" type="text" class="inputText"></td>
      </tr>
	   <tr>
	     <td width="162" align="right">发货地址：</td>
	     <td width="10" height="40" align="right">&nbsp;</td>
        <td height="40" colspan="2"><input name="address" type="text" class="inputText"></td>
      </tr>
	   <tr>
         <td align="right">邮政编码：</td>
	     <td height="40" align="right">&nbsp;</td>
	     <td height="40" colspan="2"><input name="postCode" type="text" class="inputText"></td>
  </tr>
	   <tr>
	     <td width="162" align="right">&nbsp;</td>
	     <td width="10" height="40" align="right">&nbsp;</td>
        <td height="40" colspan="2">&nbsp;</td>
      </tr>
  </table>
  </body>
</html>
