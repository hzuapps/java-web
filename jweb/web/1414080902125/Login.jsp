<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>在线作业提交系统</title>
</head>
<body>
    <h2 align="center">作业系统</h2>
    <form action="/SY/1414080902125" method="post">
    <table align="center">
    <tr><td align="right">登录名:*</td><td><input type="text" name="NAME"></td>
    </tr>
    <tr><td align="right">密码:*</td><td><input type="password" name="PW"></td>
    </tr>
    <tr><td align="right">身份:*</td>
           <td><input type="radio"  name="USER"  value="老师"  checked/>老师
                  <input type="radio"  name="USER"  value="学生"  />学生</td>
    </tr>   
    <tr><td align="right">学校*:</td>
            <td><select name="SCHOOL"  style="width:170px;">
                     <option  selectde>惠州学院</option>
                     <option >嘉应学院</option>
                     <option >肇庆学院</option>
                     </select>
                     </td>
    </tr>
    <tr><td align="right">专业*:</td>
            <td ><select name="MAJO" style="width:170px;">
                     <option selectde>软件工程</option>
                     <option >网络工程</option>
                     <option >电子工程</option>
                     </select>
                     </td>
    </tr>
    <tr>
    <td  colspan="3" align="center"  height="40">
        <input  type="submit" value="登录" >&nbsp;
        <input   type="reset" value="取消">
    </td>
    </tr>
    </table>
    </form>

</body>
</html>
