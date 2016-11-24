	$(function(){
    var id;
	var password;
	$("button").click(function(){
		id=$("#username").val();
		password=$("#userpwd").val();
		if(id=="admin"&&password=="admin"){
			$.getJSON("success.json",function(date){
				alert(date.msg);
				});
			//window.location.href="index_stu.jsp";
		}else{
			alert("Fail");
		}
	});
})

