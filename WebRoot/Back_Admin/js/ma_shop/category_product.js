/**
 * 隐藏弹出框
 */
$(document).ready(function(){
	$(".pop_up").css("display","none");
});

/**
 * 单击各按钮和链接后相应动作
 */
$(document).ready(function(){
	$(".AddOneLevel").click(function(){
		$(".pop_up").css("display","block");
		$("#popTitle").text("添加一级分类");
		$("#selectCate").css("display","none");
	});
	$(".AddTwoLevel,this").click(function(){
		$(".pop_up").css("display","block");
		$("#popTitle").text("添加二级分类");
		$("#selectCate").css("display","none");
		$("#currentID").val($(this).parents("tr").find(".pid").attr("id"));
	});
	$(".modify1,this").click(function(){
		$(".pop_up").css("display","block");
		$("#popTitle").text("修改一级分类");
		$("#selectCate").css("display","none");
		$("#currentID").val($(this).parents("tr").attr("id"));
	});
	$(".modify2,this").click(function(){
		$(".pop_up").css("display","block");
		$("#popTitle").text("修改二级分类");
		$("#selectCate").css("display","block");
		$("#currentID").val($(this).parents("tr").attr("id"));
	});
	$(".del1,this").click(function(){
		if(confirm('是否删除该一级分类？')) {
			$.ajax({
				type: "POST",
				dataType: "json",
				data: {id: $(this).parents("tr").attr("id")},
				url: "/Horizon/category_product/DelParentCategoryCtrl",
				success: function() {
					$(".pop_up").css("display","none");
					$("#caName").val("");
					$("#desc").val("");
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
				},
				error: function() {
					alert("数据删除异常，无法删除。");
				}
			});
		}
	});
	$(".del2,this").click(function(){
		if(confirm('是否删除该二级分类？')) {
			$.ajax({
				type: "POST",
				dataType: "json",
				data: {id: $(this).parents("tr").attr("id")},
				url: "/Horizon/category_product/DelChildCategoryCtrl",
				success: function() {
					$(".pop_up").css("display","none");
					$("#caName").val("");
					$("#desc").val("");
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
				},
				error: function() {
					alert("数据删除异常，无法删除。");
				}
			});
		}
	});
	$("#ok").click(function(){
		if($("#caName").val() == "" || $("#desc").val() == "") {
			alert("请将信息填写完整。");
		} else{
			switch($("#popTitle").text()) {
			case "添加一级分类":
				var url = "/Horizon/category_product/AddParentCategoryCtrl";
				break;
			case "添加二级分类":
				var url = "/Horizon/category_product/AddChildCategoryCtrl";
				break;
			case "修改一级分类":
				var url = "/Horizon/category_product/EditParentCategoryCtrl";
				break;
			case "修改二级分类":
				var url = "/Horizon/category_product/EditChildCategoryCtrl";
				break;
			}
			
			$.ajax({
				type: "POST",
				dataType: "json",
				data: {
						id: $("#currentID").attr("id"),
						caName: $("#caName").val(),
						desc: $("#desc").val()
					},
				url: url,
				success: function() {
					$(".pop_up").css("display","none");
					$("#caName").val("");
					$("#desc").val("");
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
				},
				error: function() {
					alert("数据提交异常。");
				}
			});
		}
	});
	$("#cancel").click(function(){
		$(".pop_up").css("display","none");
	});
});
