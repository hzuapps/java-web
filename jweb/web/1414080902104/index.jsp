<%@ page language="java" import="java.util.*" import="java.text.*" pageEncoding="ISO-8859-1"%>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>    
<meta charset="UTF-8">   
<% SimpleDateFormat format = new SimpleDateFormat("yyyy��MM��dd��"); 
out.println(format.format(new Date()));%>   
<title>�������õ���</title>        
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">   
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> 
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>     
</head>  
<body>     
<%     
Date date = new Date();  
date.getTime() ;   
%>    
<h3 align="center">�������õ���</h3>  
<form  name="stu" action="">    
<table>             
<tr> <td>�Ա�</td>     
<td><input type="radio" name="stuSex" checked="checked" >��           
<input type="radio" name="stuSex" >Ů    
</td>      
</tr>     
<tr> <td>��������</td>      
<td><input type="text" name="stuBirthday" class="form-control"></td>    
</tr>    
<tr> <td>�꼶��</td><td><input type="text" name="jobs" class="form-control"></td></tr>  
<tr><td>���ã�</td>     
<td><select name ="stuSelect2">      
<option selected>ƹ����</option>        
<option >��ë��</option>          
<option >����</option>         
<option >����</option>          
<option >����</option>       
<lect>     
</td>    
</tr>         
<tr><td>��������ʱ�Ľ��飺</td>    
<td colspan="2"><textarea name="Letter" rows="4" cols="40" class="form-control"></textarea> </td>   
</tr>     
<tr>    
<td><input id="btn" type="button" value="�ύ"><input type="reset" value="ȡ��"></td>   
</tr>   
</table> 
</form>  
</body> <script> $("#btn").click(function(){ $.ajax({   url: "success.json" }).done(function(data) {   if ( console && console.log ) {       console.dir(data);       alert(data.msg);  
}
}) 
})  
</script>
</html> 