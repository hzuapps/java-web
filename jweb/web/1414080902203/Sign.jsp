<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>签到界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <form action="Register" method="post" >
   <div style="position:absolute; height:100%; width:100%; background-color:#33CC99">
   		<p align="center"><font size="6" >Welcome teacher!
   		</font></p><br><hr><br>
   
   
   <table border="0" align="center" >
   		<tr><td>请选择日期进行签到！</td>
   		
				<td><h2>选择年份</h2><br>&nbsp;&nbsp;
    			<select size="4" name="year">
    			<option value="2016">2016</option>
    			<option value="2017">2017</option>
    			<option value="2018">2018</option>
    			<option value="2019">2019</option>
    			</select><br></td>
    			<td><h3>选择月份</h3><br>&nbsp;&nbsp;
    			<select size="4" name="month">
    			<option value="1">一月</option>
    			<option value="2">二月</option>
    			<option value="3">三月</option>
    			<option value="4">四月</option>
    			<option value="5">五月</option>
    			<option value="6">六月</option>
    			<option value="7">七月</option>
    			<option value="8">八月</option>
    			<option value="9">九月</option>
    			<option value="10">十月</option>
    			<option value="11">十一月</option>
    			<option value="12">十二月</option>
    			</select><br></td>
    			<td><h4>选择日期</h4><br>&nbsp;&nbsp;
    			<select size="5" name="day">
    			<option value="01">01</option>
    			<option value="02">02</option>
    			<option value="03">03</option>
    			<option value="04">04</option>
    			<option value="05">05</option>
    			<option value="06">06</option>
    			<option value="07">07</option>
    			<option value="08">08</option>
    			<option value="09">09</option>
    			<option value="10">10</option>
    			<option value="11">11</option>
    			<option value="12">12</option>
    			<option value="13">13</option>
    			<option value="14">14</option>
    			<option value="15">15</option>
    			<option value="16">16</option>
    			<option value="17">17</option>
    			<option value="18">18</option>
    			<option value="19">19</option>
    			<option value="20">20</option>
    			<option value="21">21</option>
    			<option value="22">22</option>
    			<option value="23">23</option>
    			<option value="24">24</option>
    			<option value="25">25</option>
    			<option value="26">26</option>
    			<option value="27">27</option>
    			<option value="28">28</option>
    			<option value="29">29</option>
    			<option value="30">30</option>
    			<option value="31">31</option>
    			</select><br></td>
   				</tr>
   				<tr><td align="center"><input type="submit" value="签    到">
   						<input type="reset" value="重新选择">
   				</td></tr>
   </table>
   </div>
   </form>
  </body>
</html>
