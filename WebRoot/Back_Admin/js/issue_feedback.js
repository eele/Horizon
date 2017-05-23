/**
 * 显示顾客问题内容
 * @param loginname
 */
function showIssue(loginname) {
	$(".login_name").text(loginname);
	$(".issue_title").text($("#tit_"+loginname).text());
	$(".iss_con").text($("#con_"+loginname).val());
	$('.pop_up').css({'display':'block'});
}

/**
 * 删除顾客问题条目
 * @param loginname
 */
function delIssue(loginname) {
	if(confirm("是否删除顾客 "+loginname+" 的问题？")) {
		$.ajax({
			type: "POST",
			url: "/Horizon/ma_customer/CustomerManagementCtrl?method=delIssueList",
			data:{
				loginname:loginname,
			},
			success: function(data) {
				location.reload(true);
			},
			error: function() {
				alert("操作异常，无法删除。");
			}
		});
	}
}