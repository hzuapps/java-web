<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body > 
  	现在时间是：<%=new Date() %>
    <img src="timg.jpg"width=100% height=100% >
    <div style="position:absolute; left:0; top:0; width:100%; height:100%"> 
    <script  type='text/javascript'>
			    
			function submitform(form){
			    if(form.count.value=='') {
			                alert("请输入学号!");
			                form.count.focus();
			                return false;
			           }
			       if(form.password.value==''){
			                alert("请输入班级!");
			                form.password.focus();
			                return false;
			         }
			        form.action="/qiandaoxitong/servlet/qiandao.do";
			        form.submit();
			}
			function test(){
			    alert("test");
			}
    </script>
	<br>
	<br>
        <form id="login_form" method="post"  >
            <div  style="width:100%;text-align:center">
                   <p ><font color="#F00" ><font size="4">上课签到系统</font></font></p> </div>
            <div style="width:100%;text-align:center">
                <label  class="t"><font color="#F00" >学 号：</font></label> 
                <input id="count" value="" name="count" type="text">
            </div>
            
            <div style="width:100%;text-align:center">
                <label  class="t"><font color="#F00" >班 级：</font></label> 
                <input id="password" value="" name="password" type="password" >
            </div>
            <div style="width:100%;text-align:center">
                <label class="t"></label>　　　
                <input type="submit"   onclick="submitform(this.form)" value="&nbsp;签&nbsp;到&nbsp;"> 
                <input type="reset" value="&nbsp;重&nbsp;置&nbsp;">
            </div>
        </form>
    </div>
       
  </body>
</html>
