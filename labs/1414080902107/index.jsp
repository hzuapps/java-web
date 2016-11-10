<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="utf-8"/>
    <base href="<%=basePath%>">
    
    <title>Login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="校园   学生组织   ztree">
	<meta http-equiv="description" content="About login">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </head>
  
 <body>
    <div class="container">
      <form id="login" class="form-horizontal" role="form">
 		 <div class="form-group">
   			 <label for="firstname" class="col-sm-2 control-label">名字</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" id="firstname" placeholder="名字">
  			    </div>
  		</div>
  		<div class="form-group">
    		<label for="lastname" class="col-sm-2 control-label">姓</label>
    			<div class="col-sm-10">
     		 <input type="text" class="form-control" id="lastname" placeholder="姓">
    	</div>
  	</div>
  	<div class="form-group">
    	<div class="col-sm-offset-2 col-sm-10">
      		<div class="checkbox">
        		<label>
          			<input type="checkbox">请记住我
        	</label>
      	</div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">登录</button>
    </div>
  </div>
</form>
    </div>
    
    <script type="text/javascript">
      $( "#login" ).submit(function(event) {
        $.ajax({
  			url: "/JavaWeb2/success.json",
  			type:"post",
  			dataType: "json",
  			success: function(data){
  				alert(data.msg);
  			},
  			error: function(){
  				alert("error!");
  			}
  			
		});
		 event.preventDefault();
      });
    </script>
  </body>
</html>
