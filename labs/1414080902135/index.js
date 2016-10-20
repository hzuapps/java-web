$(function(){
	var id;
	var password;
	$("input[type=button]").click(function(){
		id=$("#inputEmail3").val();
		password=$("#inputPassword3").val();
		if(id==""||password==""){
			alert("请输入你的账号和密码！");
		}else{
			$.getJSON("success.json",function(date){
				alert(date.mag);
			})
		}
	});
})