<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="edu.hzu.javaweb.labs.se1414080902231.Goods,java.util.ArrayList,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>勿闲闲物 Unused</title>
</head>
<body>
	<p></p>
	<div align="right">
		<input type="button" onclick="gotoLogin()" value="登陆" />&nbsp;
		<input type="button" value="注册" />
	</div>
	<div align="center">
		<p>
			<font size="6">Welcome to Unused!</font>
		</p>
	</div>
	<div align="center">
		<form id="searchform">
			<input type="text" name="search"/>	
			<input type="submit" value="搜索二手货物" />
			<input type="button" onclick="gotofabu()" value="发布二手货物" />	
		</form>

	</div>
	<br/>
	<div id="infomation" align="center">

	<c:if test="${!empty sessionScope.list}">
		<c:forEach var="l" items="${sessionScope.list}">
			<c:out value="${l.gN}"/>&nbsp;&nbsp;
			<c:out value="${l.dT}"/>&nbsp;&nbsp;
			<c:out value="${l.img}"/>
			<br/>
		</c:forEach>

	</c:if>

		
	</div>
	
<%-- 	<%
 	  	List<Goods> list=(ArrayList<Goods>)session.getAttribute("list");
 	/* 	for (int i = 0; i < list.size(); i++) 
 		{
  			out.print(list.get(i).getgN());
		} */

  	//		out.print(list.get(1).getgN());
		
		out.print(session.getAttribute("list"));  
	 %> --%>

</body>
<script type="text/javascript">

	$("#searchform").submit(function(){
		$.ajax({
			type:"post",
			data:$("#searchform").serialize(),
			datatype:"text",
			url:"1414080902231",
			success:function(data){
			}
		});
	});

</script>

<script type="text/javascript" >
	

 	function gotofabu() {
		//window.location.href = "issue.jsp";
		alert(2);
		$.a();
	}

 
	$.a=function(){
  		$.ajax({
  			type:"post",
  			datatype:"text",
  			url:"issue.jsp",
  			success:function(data){
  			alert(data);
  			},
  			error:function(){
  			alert("请先登录！");
  			}
  		});		
  	};
  	
  	
	function gotoLogin() {
		window.location.href = "login.jsp";
	}
</script>

</html>