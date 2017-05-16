/**
 * 当浏览器窗口变化时元素位置和尺寸自适应
 */
$(document).ready(function(){ 
	$(".mainArea").height($(window).height()-80);
	var w=$(window).width();
	var changeWidth = 900;
	if(w < 1200) {
		$(".bodyArea").width(changeWidth);
		if(w < changeWidth) {
			$(".bodyArea").css("left",(changeWidth/2)+"px");
			$(".bodyArea").css("margin-left",(-changeWidth/2)+"px");
		} else {
			$(".bodyArea").css("left","50%");
			$(".bodyArea").css("margin-left",(-changeWidth/2)+"px");
		}
	} else {
		$(".bodyArea").width(1200);
		$(".bodyArea").css("left","50%");
		$(".bodyArea").css("margin-left","-600px");
	}
	window.onresize = function() {
		$(".mainArea").height($(window).height()-80);
		var w=$(window).width();
		var changeWidth = 900;
		if(w < 1200) {
			$(".bodyArea").width(changeWidth);
			if(w < changeWidth) {
				$(".bodyArea").css("left",(changeWidth/2)+"px");
				$(".bodyArea").css("margin-left",(-changeWidth/2)+"px");
			} else {
				$(".bodyArea").css("left","50%");
				$(".bodyArea").css("margin-left",(-changeWidth/2)+"px");
			}
		} else {
			$(".bodyArea").width(1200);
			$(".bodyArea").css("left","50%");
			$(".bodyArea").css("margin-left","-600px");
		}
	};
}); 

/**
 * 加载默认嵌套页面
 */
$(document).ready(function(){ 
	$(".mainArea").load("/Horizon/shopInfo/GetShopInfoCtrl");
}); 

/**
 * 标签单击事件
 */
$(document).ready(function(){ 
	$("#tab1").click(function() {
		$(".mainArea").html("");
		$(".mainArea").load("/Horizon/shopInfo/GetShopInfoCtrl");
	});
	$("#tab2").click(function() {
		$(".mainArea").html("");
		$(".mainArea").load("/Horizon/Back_Shop/ma_product/proMain.jsp");
	});
	$("#tab3").click(function() {
		$(".mainArea").html("");
		$(".mainArea").load("/Horizon/Back_Shop/ma_order/orderMain.jsp");
	});
}); 
