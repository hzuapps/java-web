<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,edu.hzu.javaweb.labs.se1414080902210.*"%>
<html>
  <head>  <title>删除条件提交页面</title>  
  </head>
  <style>
		table{
			margin-left:auto;
			margin-right:auto;
		}
		tr{
			text-align:center;
			bgcolor:cccccc;
		}
		hr{
			width:100%;
  			size:3;
		}
	</style>  
  <body> 
         请选择删除记录条件<hr> 
        <form action= "Delete"  method="post">
             	       <table> 
	               <tr><td>学号: <input type="text" name="id"></td></tr>      
	               <!-- 性别：男 <input type="radio" value="男" name="sex" checked="checked">
	               女<input type="radio"  value="女" name="sex">
	        <br><br> 
	               年龄范围: 最小<input type="text" name="age1" value="0">&nbsp;  
	                         最大<input type="text" name="age2" value="100"> <p> 
	               体重范围: 最小<input type="text" name="weight1" value="40">&nbsp;  
	                         最大<input type="text" name="weight2" value="100"> <p> 
	               身高范围: 最低<input type="text" name="hight1" value="150">&nbsp;  
	                         最高<input type="text" name="hight2" value="190"> <p>  -->                   
	              <tr>
	              	 <td>
	              	 	  <input type="submit" value="提  交">
	              		  &nbsp;&nbsp;&nbsp;&nbsp;                  
	              		  <input type="reset" value="取  消"> 
	              	 </td>
	              </tr>
	       </table> 
       </form>
  </body>
</html>
