<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head><title>注册页面</title></head>
  <body>
   <form action="servlet/registerservlet" method="post">
   <table border="1" align="center" width="600">
   <tr><td colspan="3" align="center" height="40">注册页面</td></tr>
   <tr><td align="right">用户名：*</td>
   <td><input type="text" name="username"/></td>
   <td>用户名不小于6位</td>
   </tr>
   <tr><td align="right">密码：*</td>
   <td><input type="password" name="userpwd"/></td>
   <td>设置登录密码，至少6位!</td>
   </tr>
   <tr><td align="right">确认密码：*</td>
   <td><input type="password" name="userpwd1"/></td>
   <td>请再次输入密码!</td>
   </tr>
   <tr><td align="right">性别：*</td>
   <td><input type="text" name="usersex"/>
   <td>请输入你的性别!（male/female）</td>
   </tr>
   <tr><td colspan="3" align="center" height="40">
   <input type="submit" value="确认提交"/>&nbsp;
   <input type="reset" value="重新设置"/>
   </td></tr>
   </table>
   </form>
   <% 
   Date now=new Date();
   out.print( "现在时间是："+now );
   %>
  </body>
</html>
