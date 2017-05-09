/**
 * 打开网页时加载
 */
function load() {
	var h = $(window).height();
	$(".list").height(h-55);
	$(".commodityArea").height(h-55);
	
	// 当浏览器窗口变化时自适应网页大小
	window.onresize = function() {
		var h = $(window).height();
		$(".list").height(h-55);
		$(".commodityArea").height(h-55);
		
		var w=$(window).width();
		var changeWidth = 900;
		if(w < 1200) {
			$(".bodyArea").width(changeWidth);
			if(w < changeWidth) {
				$(".bodyArea").css("left",(changeWidth/2)+"px");
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
	
	// 搜索选择默认为“商品”
	$("#select2").css("background-color","#FF6600");
	$("#select2").css("color","white");
	$("#select1").css("background-color","white");
	$("#select1").css("color","black");
	// 搜索选择样式切换
	$("#select1").click(function() {
		$("#select1").css("background-color","#FF6600");
		$("#select1").css("color","white");
		$("#select2").css("background-color","white");
		$("#select2").css("color","black");
	});
	$("#select2").click(function() {
		$("#select2").css("background-color","#FF6600");
		$("#select2").css("color","white");
		$("#select1").css("background-color","white");
		$("#select1").css("color","black");
	});
}
