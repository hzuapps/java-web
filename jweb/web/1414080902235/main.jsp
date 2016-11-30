<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>

<html>
<head><title>主页面</title></head>
  <body>
    <%
       String power1=(String)session.getAttribute("power1");
       String username=(String)request.getAttribute("username");
       if(power1=="1")
       {
       out.println("你好，"+username+"(已登陆。)");
  
    	Date date=new Date();
     	Cookie cookie = null;
 		Cookie[] cookies = null;
	// 获取cookies的数据,是一个数组
		cookies = request.getCookies();
 		if( cookies != null ){
 		   for (int i = 0; i < cookies.length; i++){
 		       cookie = cookies[i];
 	       if((cookie.getName()).equals("name")){
 		      	String name = cookie.getValue();
 		      	request.setAttribute("name",name);
 		      	break;
 		       }
 	      }
 		}
   
       }
       else
       {
       out.println("错误，两秒后返回登陆页面。。。");
       response.setHeader("Refresh","2;url=index.jsp");
       }
     %>
  </body>
</html>
