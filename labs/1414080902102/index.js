$(function(){
    var id;
	var password;
	$("input[type=button]").click(function(){
		id=$("#inputaccount").val();
		password=$("#inputPassword").val();
		if(id==""||password==""){
			alert("����������˺ź����룡");
		}else{
			$.getJSON("success.json",function(date){
				alert(date.msg);
			})
		}
	});
})