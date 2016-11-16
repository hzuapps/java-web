<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<title>Library</title>
<style type="text/css">
	
	body {
  		position: relative;
  		overflow-x:hidden ;
	}

	a{
		text-align: center;
	}

	#jumu{
		height: 85%;
		background:url("img/heheda.jpg");
		background-attachment:fixed; 
		background-size: cover; 
		overflow: hidden;
	}

	#jumu2{
		height: 100%;
		background-color: rgba(225, 225, 225, 0.3);
	}

	#search{
		width:40%;
	}


	#jumu2 p,#jumu2 h1{
		color: white;	
	}

	#jumu2 p{
		margin-left: 1%; 
	}

	.actived{
		background-color: black;
	}

	#show{
		display: none;
		margin-left: 10%;
		text-align: center;
		margin-top: -6%;
	}

	#show p{
		display: block;
	}
	
</style>
</head>
<body scroll="auto">
<!-- 找书页面-  -->
<div id="myTabContent" class="tab-content">
	<div id="all">
	<div class="jumbotron" class="tab-pane fade in active" id="jumu">
		<div class="jumbotron"  id="jumu2">
  			<div class="container" id="hehe">
  				<h1>鸡皮疙瘩图书馆</h1>
 				<p>欢迎你</p>
 				<div class="col-lg-6">
    				<div class="input-group">
      					<div class="input-group-btn">
        					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" 	aria-expanded="false">信息<span class="caret"></span></button>
        					<ul class="dropdown-menu">
          						<li><a href="#">更多功能敬请期待</a></li>
          						<li role="separator" class="divider"></li>
          						<li><a href="#">作者--温广</a></li>
          						<li><a href="#">软件工程2班</a></li>
          						<li><a href="#">学号:1414080902237</a></li>
        					</ul>
      					</div>
      					<input type="text" class="form-control" aria-label="..." id="search">
        				<button class="btn btn-default searched" type="button" id="searched">搜索</button>
    				</div>
  				</div>
  			</div>
</div>
<script src="js/jquery-2.1.1.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	 	$(".searched").click(function(event){
	 		alert("hello!");
	       if($('.search').val() == ""){
	           alert("请输入书名！");
	       }else{
	         $.getJSON('books.json',function(data){
	           alert(data.msg);
	           location.reload();
	         });         
	       }
	 	});
	 })
</script>
</body>
</html>

