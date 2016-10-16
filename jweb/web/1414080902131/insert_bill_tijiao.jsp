<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加任意借款账单的提交页面</title>
    
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
    <form action="insert_bill.jsp"method="post">
    <table border="0"width="300"height="252">
    <tr><td>账单号</td><td><input type="text"name="zno"></td></tr>
    <tr><td>借款人</td><td><input type="text"name="jname"></td></tr>
    <tr><td>借款数目</td><td><input type="text"name="money"></td></tr>
    <tr><td>借款期限</td>
    <td>
    <select class="form-control"name="qixian"id="time">
    <option value="1个月">1个月</option>
    <option value="3个月">3个月</option>
    <option value="6个月">6个月</option>
    <option value="1年">1年</option>
    <option value="3年">3年</option>
    <option value="5年">5年</option>
    </select>
    </td>
    </tr>
    <tr><td>还款方式</td>
	<td><input type="radio"name="way"id="repayment1"value="一次性还款">一次性还款
    <input type="radio"name="way"id="repayment2"value="分期还款">分期还款</td>
	</tr>
	<tr><td>利率</td>
	<td>
	<select class="form-control"name="rate"id="rate0">
    <option>0</option>
    <option>0.05</option>
    <option>0.10</option>
    <option>0.15</option>
    <option>0.20</option>
    <option>0.25</option>
    </select>
	</td>
	</tr>
	<tr><td>应还总额</td><td><input type="text"name="sum"></td></tr>
    <tr><td>状态</td>
    <td>
    <select class="form-control"name="state"id="zhuangtai">
    <option value="未还款">未还款</option>
    <option value="已还款">已还款</option>
    </select>
    </td>
    </tr>
    <tr align="center">
    <td colspan="2">
    <input type="submit"value="提交">&nbsp;&nbsp;&nbsp;
    <input type="reset"value="取消">
    </td>
    </tr>
    </table>
    </form>
  </body>
</html>
