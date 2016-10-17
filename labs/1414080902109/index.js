$(function(){
    var id;
	var password;
	$("input[type=button]").click(function(){
		id=$("#inputaccount").val();
		password=$("#inputPassword").val();
		if(id==""||password==""){
			alert("你还没输入你的账号或密码");
		}else{
			$.getJSON("success.json",function(date){
				alert(date.msg);
			})
		}
	});
})