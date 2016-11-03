<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int i=0;
	int k=3;
	int a=i+k;
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link rel="stylesheet" href="style.css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
</head> 
<body> 
<div id=wrapper> 
<div id=lbl></div> 
<form> 
<fieldset id=account> 
<legend>个人信息</legend> 
<label for=username>账号:</label> 
<input id=username class=textbox type=text name=username required placeholder="请填写账号" /> 
<label for=password1>密码:</label> 
<input id=password1 class=textbox type=password name=password1 required placeholder="请填写密码"/> 
<label for=password2>重复密码:</label> 
<input id=password2 class=textbox type=password name=password2 required placeholder="请重复密码"/> 
<label for=email>邮箱地址:</label> 
<input id=email class=textbox type=email name=email required placeholder="www.csdn.com" /> 
</fieldset> 
<fieldset id=personal> 
<legend>其他信息</legend> 
<label for=website>个人网址:</label> 
<input id=website class=textbox type=url name=website required placeholder="http://www.example.com" /> 
<label for=age>年龄:</label> 
<input id=age class=textbox type=number name=age min=18 step=2 pattern="[0-9]{1,3}" placeholder="填写年龄"> 
<label for=salary>月薪:</label> 
<input id=salary class=textbox type=range name=salary min=0 max=50000 step=500 pattern="[0-9]{2,}" placeholder="月薪几多" value=10000 onchange="showValue(this.value)" /> 
<span id=rangevalue>10000</span> 
<script> 
function showValue(value) { 
document.getElementById("rangevalue").innerHTML=value; 
} 
</script> 
<label for=description>描述:</label> 
<textarea id=description name=description cols=30 rows=5 placeholder="这里是详细描述"></textarea>
</fieldset> 
<fieldset id=confirm> 
<input type=submit value="提交" /> 
<div class="clearfix"></div> 
</fieldset> 
</form> 
</div> 
</body> 
</html> 