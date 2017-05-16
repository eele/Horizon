/**
 * 初始化信息页面
 */
$(function(){ 
	// 初始化按钮事件
	function ex(e) {
		alert();
		$("#btn2").css("display","none");
		$("#btn1").html("<b>修改信息</b>");
		$("input[type='text']").css({border:"none"});
		$("textarea[name='desc']").css({border:"none"});
		$("input[type='text']").attr("readonly","readonly");
		$("textarea[name='desc']").attr("readonly","readonly");
		$(".modifyTr").css({display:"none"});
		$(".showTr").css({display:""});
		$("#btn1").unbind("click",ex);
	}
	$("#btn2").css("display","none");
	$("#btn1").click(function(e) {
		$("#btn2").css("display","block");
		$("#btn1").html("<b>确定</b>");
		$("input[type='text']").css({border:""});
		$("textarea[name='desc']").css({border:""});
		$("input[type='text']").attr("readonly","");
		$("textarea[name='desc']").attr("readonly","");
		$(".modifyTr").css({display:""});
		$(".showTr").css({display:"none"});
		$("#btn1").click(ex);
	});
	$("#btn2").click(function(e) {
		$("#btn2").css("display","none");
		$("#btn1").html("<b>修改信息</b>");
		$("input[type='text']").css({border:"none"});
		$("textarea[name='desc']").css({border:"none"});
		$("input[type='text']").attr("readonly","readonly");
		$("textarea[name='desc']").attr("readonly","readonly");
		$(".modifyTr").css({display:"none"});
		$(".showTr").css({display:""});
		$("#btn1").unbind("click",ex);
	});
	
	//初始化信息内容样式
	 $("input[type='text']").css({border:"none"});
	 $("textarea[name='desc']").css({border:"none"});
	 $("input[type='text']").attr("readonly","readonly");
	 $("textarea[name='desc']").attr("readonly","readonly");
	 $(".modifyTr").css({display:"none"});
	 $(".showTr").css({display:""});
}) ;