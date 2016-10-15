<!DOCTYPE html>
<html>
  <head>
    <title>register.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <table  border="1 solid black" align="center">
   		<tr>
   			<td align="center">小学生账号信息注册界面
   			<hr width="350" />	
   				<table>
   					<tr>
						<td align="left">账号:</td>
						<td align="left"><input type="text" id="raccount" name="rname" /></td>
   					</tr>
   					<tr>
   						<td align="left">密码:</td>
   						<td align="left"><input type="password" id="rpassword" name="rpassword" /></td>
   					</tr>
   					<tr>
   						<td align="left">密码确认:</td>
   						<td align="left"><input type="password" id="repetpassword" name="repetpassword" /></td>
   					</tr>
   					<tr>
   						<td align="left">邮箱地址:</td>
   						<td align="left"><input id="remail" name="remail"/>
   						<select align="left">
   							<option>@qq.com</option>
							<option>@163.com</option>
							<option>@edu.gd</option>
							<option>@168.com</option>
							<option>@baidu.gd</option>
   						</select>
   						</td>
   					</tr>
   					<tr>
   						<td align="left">手机号码:</td>
   						<td align="left"><input id="rtelephone" name="rtelephone" /></td>
   					</tr>
   					<tr>
   						<td align="left">学生学号:</td>
   						<td align="left"><input id="stuid" name="stuid" /></td>
   					</tr>
   					<tr>
   						<td align="left">昵称:</td>
   						<td align="left"><input id="stuuname" name="stuuname"/></td>
   					</tr>
   					<tr>
   						<td align="left">个人介绍:</td>
   						<td align="left">
   							<textarea id="statment" cols="20" rows="10">
   							
   							</textarea>
   						</td>
   					<tr>
   					</tr>
   						<td></td>
   						<td align="left">
   						<input type="button" value="注册" name="register" id="register"/>
   						<input type="button" value="重置" name="cancel" id="cancel"/>
   						</td>
   					</tr>
   				</table>	
   			</td>
   		</tr> 
    </table>
  </body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">	
	var id = function(id)
	{
		return document.getElementById(id);
	};
	$("#register").click(function(){
		var raccount = id("raccount");
		var password = id("rpassword");
		var repetpassword = id("repetpassword");
		var remail = id("remail");
		var rtelephone = id("rtelephone");
		var stuid = id("stuid");
		var stuuname = id("stuuname");
		if(raccount.value ==="")
		{
			alert("请输入你需要注册的账号!");
		}
		else if(rpassword.value ==="")
		{
			alert("请输入密码!");
		}
		else if(repetpassword.value === "")
		{
			alert("请再次输入密码!");
		}
		else if(remail.value === "")
		{
			alert("请输入邮箱地址!");
		}
		else if(rtelephone.value ==="")
		{
			alert("请输入密保手机号码!");
		}
		else if(stuid.value === "")
		{
			alert("请输入学生学号!");
		}
		else if(stuuname.value === "")
		{
			alert("请输入你的昵称!");
		}
		else if(rpassword.value !== repetpassword.value)
		{
			alert("两次输入密码不相同，请重新输入!");
		}
		else
		{
				$.getJSON("register.json",function(data) {
 			 	if ( console && console.log ) {
      			console.dir(data);
      			alert(data.msg);
   			 	}
				}); 
		}
	}
);
$("#cancel").click(function()
	{
		history.go(0);
	}
);
</script>
