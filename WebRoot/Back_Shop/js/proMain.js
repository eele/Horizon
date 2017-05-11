/**
 * 获取列表项
 */
$(document).ready(function() {
//	var layer1Num = 30, layer2Num = 30;
//	
//	$(".listContent").append("<ul></ul>");
//	for(var i=0; i<layer1Num; i++) {
//		$("ul").append("<li></li>");
//	}
	
	//列表项滑动样式
	for(var i=0; i<30; i++) {
		(function(){
			var index = i;
			$("#l1_"+i).click(function(){
				for(var i2=0; i2<30; i2++) {
					if(i2 == index) {
						$("#l2_"+i2).slideToggle(200);
					} else {
						$("#l2_"+i2).slideUp(200);
					}
				}
			});
		})();
	}
	$(".list").height($(".commodityArea").height()+70);
});