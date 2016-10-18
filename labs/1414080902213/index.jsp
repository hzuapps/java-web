<%@ page language="java" contentType="text/html;  charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script>
	$(function(){
		$('form').submit(function(e){
			alert("submit");
			$.ajax({
				url: 'data.json',
				datatype: 'json',
				success: function(data){
					alert(data.msg);
				}
			});
			event.preventDefault();
		});
	})
	</script>
</head>
<body>
<form class="form-horizontal" role="form" style="margin-top:300px">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label"><% out.println("Email");  %></label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label"><% out.println("Password");  %></label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-8">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me!!!
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default"><% out.println("Sign in");  %></button>
    </div>
  </div>
</form>
</body>
</html>