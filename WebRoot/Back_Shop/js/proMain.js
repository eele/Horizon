/**
 * 获取并显示商品类别列表
 */
$(document).ready(function() {
	var num = 0;
	$.ajax({
		type: "POST",
		url: "/Horizon/category_product/GetCategoryListCtrl",
		success: function(html) {
			$(".listContent").html(html);
			num = $("#getParNum").val() + 1;
			//列表项滑动样式
			for(var i=1; i<num; i++) {
				(function(){
					var index = i;
					$("#l1_"+i).click(function(){
						for(var i2=1; i2<num; i2++) {
							if(i2 == index) {
								$("#l2_"+i2).slideToggle(200);
							} else {
								$("#l2_"+i2).slideUp(200);
							}
						}
					});
				})();
			}
			//二级分类单击效果
			$(".listLayer2,this").click(function(){
				$(".listLayer2").css({"border-left-width": "1px"});
				$(this).css({"border-left-width": "7px"});
			});
		},
		error: function() {
			$(".listContent").html("<h3 align='center'><font color='white'>Error</font><h3>");
		}
	});
});

/**
 * 商品类别列表高度调整
 */
$(document).ready(function(){ 
	if($(".commodityArea").height()+70 > $(window).height()) {
		$(".list").height($(".commodityArea").height()+70);
	} else {
		if($(window).height() < 600){
			$(".list").height(600);
		} else {
			$(".list").height($(window).height());
		}
	}
	$(window).resize(function() {
		if($(".commodityArea").height() > $(window).height()) {
			$(".commodityArea").height($(".commodityArea").height()+70);
		} else {
			if($(window).height() < 600){
				$(".list").height(600);
			} else {
				$(".list").height($(window).height());
			}
		}
	});
});