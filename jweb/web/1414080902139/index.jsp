<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Add Your Resume</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      	<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      	<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		.headline{
			padding-right: 0;
			padding-left: 0;
			background-color:#5bc0de;
			margin-top:0;
			margin-bottom: 15px;
			height: 45px;
			line-height: 45px;
			font-size: 24px;
			color: #ffffff
		}
	</style>
  </head>
  
 <body>
 <div class="container">
	<form id="target" class="form-horizontal" role="form" action="servlet/Se1414080902139Servlet" mothod="post" style="background-color: #f5f5f5;margin-bottom:0">
	<!-- headline -->
	<div class="headline text-center">Add Your Resume</div>
	<!-- Name -->
	<div class="form-group">
    	<label for="FullName" class="col-sm-2 col-sm-offset-2 control-label text-nowrap">Full Name</label>
    	<div class="col-sm-5">
      		<input type="text" name="fullnameinfo" class="form-control" id="fullname" placeholder="Full Name">
    	</div>	
    </div>
    <!-- Sex -->
	<div class="form-group">
		<label for="Sex" class="col-sm-2 col-sm-offset-2 control-label">Sex</label>
    	<div class="col-sm-5" >
    		<select class="form-control" name="sexinfo" id="sex">
    			<option value="Male">Male</option>
    			<option value="Female">Female</option>
    		</select>
    	</div>
   	<!-- Grade --> 		
  	</div>
  	<div class="form-group">
  		<label for="Grade" class="col-sm-2 col-sm-offset-2 control-label">Grade</label>
    	<div class="col-sm-5">
      		<select class="form-control" name="gradeinfo" id="grade">
    			<option value="Freshman">Freshman</option>
    			<option value="Sophomore">Sophomore</option>
    			<option value="Junior">Junior</option>
    			<option value="Senior">Senior</option>
    			<option value="Graduate">Graduate</option>
    		</select>
    	</div>
  	</div>
  	<!-- Profession -->
  	<div class="form-group">
  		<label for="Profession" class="col-sm-2 col-sm-offset-2 control-label">Profession</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" id="profession" name="proinfo" placeholder="Profession">
    	</div>
  	</div>
  	<!-- Tel -->
  	<div class="form-group">
  		<label for="Tel" class="col-sm-2 col-sm-offset-2 control-label">Tel</label>
    	<div class="col-sm-5">
      		<input type="tel" class="form-control" id="tel" name="telinfo" placeholder="Telephone Number">
    	</div>
  	</div>
  	<!-- Email -->
  	<div class="form-group">
  		<label for="" class="col-sm-2 col-sm-offset-2 control-label">Email</label>
    	<div class="col-sm-5">
      		<input type="email" class="form-control" id="email" name="emailinfo" placeholder="Email">
    	</div>
  	</div>
  	<!-- Hobby -->
  	<div class="form-group">
  		<label for="hobby" class="col-sm-2 col-sm-offset-2 control-label">Hobby</label>
    	<div class="col-sm-5">
      		<textarea class="form-control" id="hobby" name="hobbyinfo"></textarea>
    	</div>
  	</div>
  	<!-- Speciality -->
  	<div class="form-group">
  		<label for="" class="col-sm-2 col-sm-offset-2 control-label">Speciality</label>
    	<div class="col-sm-5">
      		<textarea class="form-control" rows="3" id="speciality" name="speinfo"></textarea>
    	</div>
  	</div>
  	<!-- Experience -->
  	<div class="form-group">
  		<label for="" class="col-sm-2 col-sm-offset-2 control-label">Experience</label>
    	<div class="col-sm-5">
      		<textarea class="form-control" rows="3" id="experience" name="expinfo"></textarea>
    	</div>
  	</div>
  	<!-- Button -->
  	<div class="form-group" style="margin-bottom: 0">
    	<div class="col-sm-offset-4 col-sm-5">
      		<button id="submit" type="submit" class="btn btn-success">Submit</button>
      		<button type="reset" class="btn btn-info">Reset</button>
    	</div>
  	</div>
</form>
<div style="height: 15px;background-color: #f5f5f5"></div>
<footer>
  <div class="text-center" style="background-color: #ddd;">
      <a href="#">Jiushig</a>&nbsp;&copy;&nbsp;<span><%=new Date()%></span>
  </div>
</footer>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#target").submit(function (event) {
			var fullname = $("#fullname").val();
            var profession = $("#profession").val();
            var tel = $("#tel").val();
            var email = $("#email").val();
            var hobby = $("#hobby").val();
            var speciality = $("#speciality").val();
            var experience = $("#experience").val();
            
            if(fullname == ""){
            	alert("Please input your fullname !");
            	event.preventDefault();
            }else if(profession == ""){
            	alert("Please input your profession !");
            	event.preventDefault();
            }else if(tel == ""){
            	alert("Please input your telephone number !");
            	event.preventDefault();
            }else if(email == ""){
            	alert("Please input your Email !");
            	event.preventDefault();
            }
		})
	})
</script>
</body>
</html>