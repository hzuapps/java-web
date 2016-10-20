$(function(){
	var id;
	var password;
	$("input[type=button]").click(function(){
		id=$("#inputEmail3").val();
		password=$("#inputPassword3").val();
		if(id==""||password==""){
			alert("Please input your username and password!");
		}else{
			$.getJSON("success.json",function(date){
				alert(date.msg);
			})
		}
	});
})