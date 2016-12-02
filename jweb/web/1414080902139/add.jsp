<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>录入简历</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<style type="text/css">
	body{
		font-family: "微软雅黑";
	}
	.nav{
		background-color: #f8f8f8;
	}
	.home{
		padding-left: 15px;
	}
	.home:hover{
		text-decoration: none;
	}
	.tab-content{
		margin-top: 15px;
	}
	ul{
		background-color: #f8f8f8;
		display: block;
		margin: 0;
		padding: 0;
	}
	.right li{
		list-style:none;
		display: inline;
		padding-right: 15px;
	}
	ul li a:hover{
		text-decoration: none;
	}
	.right{
		float: right;
	}
	h1{
		margin: 0;
		padding-bottom:20px;
		margin-bottom: 15px;
		font-weight: bold;
		color: hsl(145,63%,49%);
		font-size: 30px;
		background-color: #f8f8f8;
	}
	label{
		font-family: "微软雅黑";
		font-size: 18px;
	}
	.navbar{
		border: 0;
	}
	.navbar-nav{
		margin: 0;
	}
	.navbar-nav li:hover{
		background-color: #eee;
		border-radius: 4px;
	}
	</style>
  </head>
  
  <body>
	<div class="container">
		<div class="nav">
			<a href="home.jsp" class="home">返回首页</a>
			<ul class="right">
				<li>
					<c:if test="${ _username == null || _username ==''}">
						<a href="login.jsp">你好，请登录</a>
					</c:if>
					<c:if test="${ _username != null }">
							欢迎你，<c:out value="${ _username }"></c:out>
  					</c:if>
				</li>
				<li><a href="#">注册</a></li>
			</ul>  			
		</div>
		<h1 class="text-center">录入简历</h1>
		<form class="form-horizontal" action="servlet/addServlet" method="post">
        	<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">姓名</label>
		    	<div class="col-sm-5">
		      		<input type="text" name="name" class="form-control" id="">
		    	</div>
			</div>

			<div class="form-group">
				<label for="" class="col-sm-4 control-label">性别</label>
		    	<div class="col-sm-5" >
		    		<select class="form-control" name="sex">
		    			<option value="男">男</option>
		    			<option value="女">女</option>
		    		</select>
		    	</div>		
		  	</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">专业</label>
		    	<div class="col-sm-5">
		      		<input type="text" name="profession" class="form-control" id="">
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">学历</label>
		    	<div class="col-sm-5">
		      		<input type="text" name="education" class="form-control" id="">
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">电话</label>
		    	<div class="col-sm-5">
		      		<input type="tel" name="tel" class="form-control" id="">
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">邮箱</label>
		    	<div class="col-sm-5">
		      		<input type="email" name="email" class="form-control" id="">
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">兴趣爱好</label>
		    	<div class="col-sm-5">
		      		<textarea class="form-control" id="hobby" name="hobby" rows="4"></textarea>
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">实践经历</label>
		    	<div class="col-sm-5">
		      		<textarea class="form-control" id="experience" name="experience" rows="4"></textarea>
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">个人技能</label>
		    	<div class="col-sm-5">
		      		<textarea class="form-control" id="skill" name="skill" rows="4"></textarea>
		    	</div>
			</div>

			<div class="form-group">
		    	<label for="" class="col-sm-4 control-label">荣誉资质</label>
		    	<div class="col-sm-5">
		      		<textarea class="form-control" id="honor" name="honor" rows="4"></textarea>
		    	</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
					<button id="submit" type="submit" class="btn btn-success">提交</button>
					<button type="reset" class="btn btn-info">重置</button>
				</div>
			</div>
        </form> 	
	</div>	
	<!-- 引入jQuery和bootstrap -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>