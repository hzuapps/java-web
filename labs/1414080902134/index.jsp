<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Online Note</title>
	<script src = "http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js">
	</script>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel = "styleSheet"/>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" rel = "styleSheet"/>
	<script src = "http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="padding : 10px;">
	    <div class="panel col-sm-6">
	        <form role="form" id="login">
	            <div class="form-group">
	                <label for="exampleInputEmail1">
	                	User Name
	                </label>
	                <input type="text" 
	                		class="form-control" 
	                		id="exampleInputEmail1" 
	                		placeholder="Enter User Name"/>
	            </div>
	            <div class="form-group">
	                <label for="exampleInputPassword1">
	                	Password
	                </label>
	                <input type="password" 
	                		class="form-control" 
	                		id="exampleInputPassword1" 
	                		placeholder="Password"/>
	            </div>
	            <div class="checkbox">
	                <label>
	                    <input type="checkbox">
	                    	Remember Me
	                </label>
	            </div>
	            <button type="button" 
	            		class="btn btn-default" 
	            		onclick="JQJSONRequest()">Another</button>
	              </form>
	          </div>
	      </div>
	</div>
	<div class="container" style="padding : 10px;">
	      <div class = "panel col-sm-6">
	      	<form role = "form" id = "quickget">
		      	<div class="form-group">
		      		<label for = "qc">Quick Code</label>
		      		<br/>
			      	<input type = "text" id = "qc"
		                	placeholder="Enter Quick Code"/>
               	</div>
		      	<div class = "form-group">
					<button type = "button" class = "btn btn-default" 
							onclick = "quickget()">Get Note</button>
		      	</div>
	      	</form>
	      </div>
		<div id = "result" role="alert" 
			class="alert alert-info col-sm-8" 
			style="width : 100%;">
		</div>
	<script>
	         //To be honest , I really did not know why need this function , because I think it is useless .
	function  JQDearWithForm(){
		$( "#target" ).submit(function( event ) {
			alert( "Handler for .submit() called." );
			event.preventDefault();
		});
	}
	function JQJSONRequest() {
		$.ajax({
			url : "Target.jsp",	// wait for realize
			complete : function(data) {
			    console.log(data);
			    if (data.readyState == 4 && data.status == 200) {
			        var str = "",
			            resp = JSON.parse(data.responseText);
			        str = "Result :";
			        for (var i in resp) {
			            str += "<br/>" +  i + "　　" + resp[i]
			        }
			        $("#result").html(str);
			    } else {
			        $("#result").text("Result : some thing error");
			    }
			}
		});
	}
	</script>
</body>
</html>