$(function() {
	$(".inner").hover(function() {
		$(this).css("border", "3px solid #FFCFB1");
	}, function() {
		$(this).css("border", "3px solid #ffffff");
	});
});

/**
 * 商品类别列表高度调整
 */
$(document).ready(function(){ 
	$(".list").height($(".divProduct").height()+136);
});
