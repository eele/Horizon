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
</head>

<body>
	<!--分页 -->
	<div style="width:380px;margin:0 auto;margin-top:50px;">
		<ul class="pagination" style="text-align:center; margin-top:10px;">
			<c:if test="${pBean.currentPage<=1 }">
				<li class="disabled"><a href="#" aria-label="Previous"><span
						aria-hidden="true">&laquo;</span>
				</a>
				</li>
			</c:if>
			<c:if test="${pBean.currentPage>1 }">
				<li><a
					href="${pageContext.request.contextPath }/product?method=findByPage&currentPage=${pBean.currentPage-1}&cid=
　　　　　　　　　　　　　　${pBean.bean[0].cid }"
					aria-label="Previous"><span aria-hidden="true">&laquo;</span>
				</a>
				</li>
			</c:if>

			<!-- <li class="active"><a href="#">1</a></li> -->
			<c:forEach begin="${pBean.currentPage-5>0?pBean.currentPage-5:1}"
				end=　　　　　　　　　　　　　　　　"${pBean.currentPage+4>pBean.totalPage ?pBean.totalPage:pBean.currentPage+4}" var="i">
                    <li><a
					href="${pageContext.request.contextPath }/product?method=findByPage&currentPage=${i }
　　　　　　　　　　　　　　　　&cid=${pBean.bean[0].cid }">${i
						}</a>
				</li>
			</c:forEach>

			<c:if test="${pBean.currentPage>=pBean.totalPage }">
				<li class="disabled"><a href="#" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span> </a></li>
			</c:if>
			<c:if test="${pBean.currentPage<pBean.totalPage }">
				<li><a
					href="${pageContext.request.contextPath }/product?method=findByPage&currentPage=
　　　　　　　　　　　　　　　　　　${pBean.currentPage+1}&cid=${pBean.bean[0].cid }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a></li>
			</c:if>
		</ul>
	</div>
	<!-- 分页结束  -->
</body>
</html>
