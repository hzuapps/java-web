<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<html>
  <head>
    
    <title>添加任意客户订单的提交页面</title>

  </head>
  
  <body>

    <form action="insert_ca_1.jsp" method="post">
    	<table border="0" width="238" height="252">
    	<tr><td>客户ID</td><td><input type="text"name="userid"></td></tr>
    	<tr><td>运营商</td><td><input type="text"name="operator"></td></tr>
    	<tr><td>充值面值</td><td><input type="text"name="value"></td></tr>
    	<tr><td>数量</td><td><input type="text"name="number"></td></tr>
    	<tr align="center">
    	    <td colspan="2">
    	     <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;
    	     <input type="reset" value="取消">
    	     </td>
    	</tr>
    </table>
    	
   </form>
  </body>
</html>
