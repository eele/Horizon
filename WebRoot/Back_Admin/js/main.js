/**
 * 管理界面左栏选项单击选中效果
 */
$(document).ready(function(){ 
	$(".itemStyle").click(function(e){
		$(".itemStyle").css({
			"border-right-width": "0px",
			"background-color": ""
		});
		$(e.target).css({
			"border-right-width": "6px",
			"background-color": "#354457"
		});
	});
});

/**
 * 左栏高度自动调整
 */
$(document).ready(function(){ 
	if($(".mainArea").height() > $(window).height()) {
		$(".left").height($(".mainArea").height());
	} else {
		if($(window).height() < 600){
			$(".left").height(600);
		} else {
			$(".left").height($(window).height());
		}
	}
	$(window).resize(function() {
		if($(".mainArea").height() > $(window).height()) {
			$(".left").height($(".mainArea").height());
		} else {
			if($(window).height() < 600){
				$(".left").height(600);
			} else {
				$(".left").height($(window).height());
			}
		}
	});
});

/**
 * 单击各项打开相应嵌套网页
 */
$(document).ready(function(){ 
	$(".itemStyle").click(function(e){
		var itemName = $(e.target).text();
		switch(itemName) {
		case "店铺开通审核":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/ma_shop/confirm_reg.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "店铺类别管理":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/ma_shop/category_shop.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "商品类别管理":
			$.ajax({
				method: "get",
				url: "/Horizon/category_product/FindAllCategoryCtrl",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "顾客个人信息":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/ma_customer/per_info.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "顾客交易记录":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/ma_customer/trans_record.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "顾客问题反馈":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/ma_customer/issue_feedback.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		case "修改个人密码":
			$.ajax({
				method: "get",
				url: "/Horizon/Back_Admin/changePwd.jsp",
				success: function(data){
					$(".mainArea").html(data);
				},
				error: function(data){
					$(".mainArea").html("<h1 align='center'>网页加载异常</h1>");
				}
			});
			break;
		}
	});
});
