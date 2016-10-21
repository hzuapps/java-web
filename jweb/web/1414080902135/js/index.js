$(function(){
	var id;
	var check_psss;
	var password;
	var load;
	var save;
	//邮箱匹配正则表达式
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	
	$("input[type=button]").click(function(){
		load=$(this).attr("id");
		// 登录
		if(load=="load1"){
			id=$("#inputEmail3").val();
			password=$("#inputPassword3").val();
			
			//后端创建用户cookie，前端显示cookie内容，实现用户免输入登录(还没实现)
			save=$("input[type=checkbox]:checked").val();
			if(save!="save"){
				save="unsave";
			}
			if(id==""||password==""){
				alert("请输入你的账号和密码！");
				return false;
			}else if(filter.test(id)){
				$.ajax({
					url:"1414080902135",
					type:"post",
					data:{
						"id" : id,
						"password" : password,
						"load" : load,
						"save" : save
					},
					success:function(value){
						if(value==1){
							window.location.href="shop.html";
							return false;
						}else if(value==0){
							alert("账号或密码错误，请重新输入");
							return false;
						}
					}
				})
			}else{
				alert("邮箱地址出错，请重新输入");
				return false;
			}
			//注册
		}else if(load=="load2"){
			id=$("#inputEmail4").val();
			password=$("#inputPassword4").val();
			check_pass=$("#inputPassword5").val();
			
			if(id==""||password==""||check_pass==""){
				alert("请输入完整信息！");
				return false;
			}else if(filter.test(id)){
				if(check_pass==password){
					$.ajax({
						url:"1414080902135",
						type:"post",
						data:{
							"id" : id,
							"password" : password,
							"load" : load
						},
						success:function(value){
							if(value==1){
								window.location.href="shop.html";
							}else if(value==0){
								alert("账户已存在，请重新输入");
							}
						}
					})
				}else{
					alert("密码确认出错，请重新输入");
					return false;
				}
			}else{
				alert("邮箱地址出错，请重新输入");
				return false;
			}
		}
	});
})