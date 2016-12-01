function f_register()
{
	var acc = document.getElementById("account").value;
	var pwd = document.getElementById("password").value;
	var name = document.getElementById("name").value;
	var pwdr = document.getElementById("passwordr").value;
	if(acc == "")
		{
			acc_rs.innerHTML = "<b style='color:#FF0000'>请输入账号</b>";
		}
	if(pwd == "")
		{
			pwd_rs.innerHTML = "<b style='color:#FF0000'>请输入密码</b>"
		}
	if(pwdr == "")
		{
			pwd2_rs.innerHTML = "<b style='color:#FF0000'>请再次输入密码</b>";
		}
	if(name == "")
		{
			name_rs.innerHTML = "<b style='color:#FF0000'>请输入用户昵称</b> ";
		}
	if(acc!=""&&pwd!=""&&pwdr!=""&&name!="" && acc_rs.innerHTML == "" && pwd_rs.innerHTML == "" &&pwd2_rs.innerHTML == ""&& name_rs.innerHTML == "")
		{
		$.ajax({
					type: 'post',
					url : '/ajax_two/servlet/servlet?account='+acc+'&password='+pwd+'&name='+name,
					success:function(msg)
					{
						if('success' == msg)
						{
							location.replace("/ajax_two/servlet/servlet");
						}
						else
						{
						
						}
					}
			
			}).done(function(data)
					{
						console.log(data);
						json = JSON.parse(data);
			
					})
			location.replace("success.jsp");
		}
	
}

function f_pwdrcheck()
{
	var pwd = document.getElementById("password").value;
	var pwdr = document.getElementById("passwordr").value;
	if(pwd == pwdr)
		{
			pwd2_rs.innerHTML ="";
		}
	else
		{
			pwd2_rs.innerHTML = "<b style='color:#FF0000'>两次输入密码不相同</b>";
		}
}
function f_acccheck()
{
	var acc = document.getElementById("account").value;
	if(acc !="")
		{
			acc_rs.innerHTML ="";
			$.ajax({
				type: 'post',
				url : '/ajax_two//servlet/check?account='+acc,
				success:function(msg)
				{
					if('success' == msg)
						{
							location.replace("/ajax_two/servlet/check");
						}
					else
						{
							
						}
				}
				
			}).done(function(data)
			{
				console.log(data);
				json = JSON.parse(data);
				for(var i in json)
					{
						acc_rs.innerHTML = json["account"];
					}
			})
		}
}	

function f_pwdcheck()
{
	var pwd = document.getElementById("password").value;
	var pwdr = document.getElementById("passwordr").value;
	if(pwd != "")
		{
			pwd_rs.innerHTML ="";
		}
	if(pwd == pwdr)
		{
			pwd2_rs.innerHTML ="";
		}
	else
		{
			pwd2_rs.innerHTML = "<b style='color:#FF0000'>两次输入密码不相同</b>";
		}
}
function f_namecheck()
{
	var name = document.getElementById("name").value;
	if(name !="")
		{
			name_rs.innerHTML ="";
			$.ajax({
				type :'post',
				url : '/ajax_two/servlet/check?name='+name,
				success:function(msg)
				{
					if('success' == msg)
						{
							location.replace("/ajax_two/servlet/check");
						}
					else
						{
						
						}	
				}
			}).done(function(data){
				console.log(data);
				json = JSON.parse(data);
				for(var i in json)
					{
						name_rs.innerHTML = json["name"];
					}
			})
		}
}
