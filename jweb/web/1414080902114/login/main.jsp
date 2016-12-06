 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
    <!-- <base href="<%=basePath%>"> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>欢迎来到医院电子标牌系统</title>
    <link rel="stylesheet" type="text/css" href="/jweb/login/css/main.css">
    <style type="text/css">
    @import "/jweb/login/css/init.css";
    </style>
    <script type="text/javascript" src="/jweb/login/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/jweb/login/js/left-select.js"></script>
</head>
<body>
    <div class="container">
		<div class="header">
	        <span>社团管理系统</span>
		</div> 

		<div class="content">
			<div class="content-left">
			      <div class="left-select-top-img"><span onclick="show('left-select-systems')"></span></div>
			      <div class="left-select-system"><span>系统选项</span></div>
			       
					<ul onmouseover=on() onmouseout=out() id="left-select-systems" style="display:block" >
						<li class="five"><a href="#">信息查询</a></li>
						<li class="five"><a href="#">资料修改</a></li>
						<li class="five"><a href="#">添加成员</a></li>
            <li class="five"><a href="#">删除成员</a></li>
					</ul>

				   <div class="left-select-info"><span class="info-ico" onclick="show('left-select-infos')"></span><span class="info-ico-text">个人中心</span></div>
				   <ul onmouseover=on() onmouseout=out() id="left-select-infos" style="display:none"> 
						<li class="five"><a href="#">个人信息</a></li>
						<li class="five"><a href="#">密码修改</a></li>
				   </ul>
			</div>
			<div class="content-right">
				<h1 class="content-right-h1">
					<span>
					<c:if test="${hour>=0&&hour<=12}">上午好！</c:if>
		            <c:if test="${hour>12&&hour<=17}">下午好！</c:if>
		            <c:if test="${hour>17&&hour<=24}">下午好！</c:if>
		            <c:out value="${sessionScope.username}"/></br>
	                                欢迎使用校园社团管理系统
	                </span>
	            </h1>
			</div>
		</div>

		<div class="left-bottom">
		 <font color=#fff></font>
		<span id="left-bottom"></span>
		<span id="left-bottom-date"></span>
		</div>
         
		<div class="footer">
		</div>     	
	</div>
   <script type="text/javascript" src="/jweb/login/js/time.js"></script>
</body>
</html>