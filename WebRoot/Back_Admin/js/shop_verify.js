/**
 * 鼠标经过表格某一行时自动完整显示内容
 */
$(function(){
	$("td,this").mouseenter(function() {
		$(this).parent().children("td").css({
			"white-space": "normal",
			"overflow": "visible",
			"text-overflow": "clip",
		});
	});
	
	$("td,this").mouseleave(function() {
		$(this).parent().children("td").css({
			"white-space": "nowrap",
			"overflow": "hidden",
			"text-overflow": "ellipsis",
		});
	});
});

/**
 * 批准用户开店
 * @param loginname
 */
function allow(loginname) {
	if(confirm("确定允许用户 " + loginname + " 开店吗？")) {
		$.ajax({
			type: "get",
			url: "/Horizon/admin/ma_shop/ShopManagementCtrl?method=changeVerifyStatus&status=1&loginname="+loginname,
			success: function() {
				location.reload(true);
			},
			error: function() {
				alert("操作异常。");
			}
		});
	}
}

/**
 * 拒绝用户开店
 * @param loginname
 */
function refuse(loginname) {
	if(confirm("确定拒绝用户 " + loginname + " 开店吗？")) {
		$.ajax({
			type: "get",
			url: "/Horizon/admin/ma_shop/ShopManagementCtrl?method=changeVerifyStatus&status=0&loginname="+loginname,
			success: function() {
				location.reload(true);
			},
			error: function() {
				alert("操作异常。");
			}
		});
	}
}

function delVerifyInfo(loginname) {
	if(confirm("确实要删除用户 " + loginname + " 的待审核信息吗？")) {
		$.ajax({
			type: "get",
			url: "/Horizon/admin/ma_shop/ShopManagementCtrl?method=delVerifyInfo&loginname="+loginname,
			success: function(data) {
				location.reload(true);
			},
			error: function() {
				alert("操作异常，无法删除该待审核信息。");
			}
		});
	}
}