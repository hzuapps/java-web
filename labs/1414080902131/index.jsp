<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <style type="text/css">
h1{
	background:#9F9;
	color:#FFF;
	font-family:Verdana, Geneva, sans-serif;
	text-align:center;
}
h2{
	background:#FF0;
	color:#F00;
	font-family:Arial, Helvetica, sans-serif;
	text-align:center;
}
p{
	text-align:left
}
#p1{font-family:Arial, Helvetica, sans-serif;
font-size:large;
color:#000;
}
#p2{font-family:"Palatino Linotype", "Book Antiqua", Palatino, serif;
font-size:small;
}
</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
   <body bgcolor="#66FFFF"><h1 align="center">审核通过：您符合借款人的条件！</h1>
<h2 align="center">您的借款额度为10000元</h2>
<form action="return.jsp" method="post">
<div>
<p id="p1">*********************借款须知********************************</p>
<p id="p2">（1）违约缴纳罚款<br>
（2）提前还款返回手续费<br>
（3）还款状况影响个人信用记录<br>
（4）违约3次取消借款资格<br>
(5)还款利息说明<br>
</p>
</div>
<div class="checkbox">
<label>
<input type="checkbox"name="right"id="denfity">已阅读以上信息
</label>
</div>
<div class="form-group">
<label for="num1">请输入您借款的数目：</label>
<input type="text"class="form-control"name="money1"id="num1">
</div>
<hr>
<div class="form-group">
<p id="p1">请填写您的还款计划</p>
<label>借款期限：</label>
<select class="form-control"name="qixian"id="time">
<option>1个月</option>
<option>3个月</option>
<option>6个月</option>
<option>1年</option>
<option>3年</option>
<option>5年</option>
</select>
</div>

<p id="p1">还款方式：</p>
<div class="radio">
<label>
<input type="radio"name="repayment"id="repayment1"value="一次性还款">一次性还款
</label>
</div>
<div class="radio">
<label>
<input type="radio"name="repayment"id="repayment2"value="分期还款">分期还款
</label>
</div>
<div class="form-group">
<label for="paymentPassword">支付密码</label>
<input type="password"class="form-control"name="mima"id="paymentPassword">
</div>
<button type="submit"class="btn btn-default">提交</button>
</form>
<hr>
借款的日期和时间：<%=new Date() %>
    
  </body>
</html>
