<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*,java.io.*" %>
<html>
<!-- �� Bootstrap ���� CSS �ļ� -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
 
 <!-- ��ѡ��Bootstrap�����ļ���һ�㲻�����룩 -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
 
 <!-- jQuery�ļ��������bootstrap.min.js ֮ǰ���� -->
 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
 
 <!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
 <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <head><title>ѧ����Ϣ�ǼǱ�</title></head>
 <body>
 <%request.setCharacterEncoding("utf-8");%>
 <center>
 <div class="container">
 <table class="table">
 <tbody>
 <tr>
 <td><b>ע������</b></td>
 <td><%=request.getParameter("registername")%></td>
 </tr>
 <tr>
 <td><b>��½����</b></td>
 <td><%=request.getParameter("pwd")%></td>
 </tr>
 <tr>
 <td><b>��ʵ����</b></td>
 <td><%=request.getParameter("TrueName")%></td>
 </tr>
 <tr>
 <td><b>���֤��</b></td>
 <td><%=request.getParameter("PersonalCode")%></td>
 </tr>
 <tr>
 <td><b>�Ա�</b></td>
<td>
 <%=request.getParameter("Sex")%>
 </td>
 </tr>
 <tr>
 <td><b>��������</b></td>
<td><%=request.getParameter("BirthDate")%></td>
 </tr>
 <tr>
 <td><b>��ϵ�绰</b></td>
<td><%=request.getParameter("HomeNum")%></td>
 </tr>
 <tr>
 <td><b></b>E-mail</td>
 <td><%=request.getParameter("Email")%></td>
 </tr>
 <tr>
 <td><b>ϵ��</b></td>
 <td><%=request.getParameter("Department")%></td>
 </tr>
 </tbody>
 </table>
 </div>
 </center>
 </body>
 </html> 