<%@ page language="java" import="java.util.*" import="java.text.*" pageEncoding="ISO-8859-1"%>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>    
<meta charset="UTF-8">   
<% SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日"); 
out.println(format.format(new Date()));%>   
<title>体育爱好调查</title>        
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">   
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> 
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>     
</head>  
<body>     
<%     
Date date = new Date();  
date.getTime() ;   
%>    
<h3 align="center">体育爱好调查</h3>  
<form  name="stu" action="">    
<table>             
<tr> <td>性别：</td>     
<td><input type="radio" name="stuSex" checked="checked" >男           
<input type="radio" name="stuSex" >女    
</td>      
</tr>     
<tr> <td>出生日期</td>      
<td><input type="text" name="stuBirthday" class="form-control"></td>    
</tr>    
<tr> <td>年级：</td><td><input type="text" name="jobs" class="form-control"></td></tr>  
<tr><td>爱好：</td>     
<td><select name ="stuSelect2">      
<option selected>乒乓球</option>        
<option >羽毛球</option>          
<option >足球</option>         
<option >网球</option>          
<option >其他</option>       
<lect>     
</td>    
</tr>         
<tr><td>对体育课时的建议：</td>    
<td colspan="2"><textarea name="Letter" rows="4" cols="40" class="form-control"></textarea> </td>   
</tr>     
<tr>    
<td><input id="btn" type="button" value="提交"><input type="reset" value="取消"></td>   
</tr>   
</table> 
</form>  
</body> <script> $("#btn").click(function(){ $.ajax({   url: "success.json" }).done(function(data) {   if ( console && console.log ) {       console.dir(data);       alert(data.msg);  
}
}) 
})  
</script>
</html> 