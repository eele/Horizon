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