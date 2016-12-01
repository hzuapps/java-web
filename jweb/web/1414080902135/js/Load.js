/**
 * 用户打开网页，自动访问后端，用于创建用户账号的session
 */
$(function(){
	$.ajax({
		url:"User_Session",
		type:"get"
	})
})