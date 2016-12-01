<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.hzu.javaweb.labs.se1414080902134.note" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Online Note</title>
	<script src = "http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js">
	</script>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel = "styleSheet"/>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" rel = "styleSheet"/>
	<script src = "http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src = "js/bgimage.js"></script>
	<style>
		.main{
			position : absolute;
			width : 80%;
			left : 10%;
			padding : 5px;
		}
		@media only screen 
		and (min-width : 0px)
		and (max-width : 400px)
		{
			。main {
				position : absolute;
				width : 92%;
				left : 4%;
				padding : 5px;
			}
		}
		.bgt {
			background : rgba(133, 197, 138, 0.2);
		}
	</style>
</head>
<body>
<script>
	window.onload = function(){
		bg();
	}
</script>
<div class = "main">
	<%
		if (session.getAttribute("info") != null) {
			out.append(
					"<div class = 'alert alert-info col-sm-8' style = 'width : 100%;'><span style = 'color:red;font-size:lager;'>" + 
					session.getAttribute("info") + 
					"</span></div>");
			session.setAttribute("info",null);
		}
	%>
	<div class="panel panel-info col-sm-8 bgt">
	    <div class="panel-heading">
	    	Login
	    </div>
	    <div class="panel-body">
	        <form id="login" action = "../1414080902134" method = "post">
	        <!-- <form role="form" id="login" action = "../MockLogin" method = "post"> -->
	            <div class="form-group">
	                <label for="exampleInputEmail1">
	                	User Name
	                </label>
	                <input type="text" 
	                		name = "UserName"
	                		class="form-control" 
	                		id="exampleInputEmail1" 
	                		placeholder="Enter User Name"
	                		value = "ibas"
	                		/>
	            </div>
	            <div class="form-group">
	                <label for="exampleInputPassword1">
	                	Password
	                </label>
	                <input type="password" 
	                		name = "Password"
	                		class="form-control" 
	                		id="exampleInputPassword1" 
	                		placeholder="Password"
	                		value = "ibas"
	                		/>
	            </div>
	            <div class="checkbox">
	                <label>
	                    <input type="checkbox" name = "Remember">
	                    	Remember Me
	                </label>
	            </div>
	            <button type="submit" 
	            		class="btn btn-default" 
	            		onclick="JQJSONRequest()">Another</button>
	         </form>
	      </div>
	</div>
	
	<div class="panel panel-info col-sm-6 bgt">
	    <div class="panel-heading">
	    	QuickGet
	    </div>
     <div class = "panel-body">
     	<!-- <form role = "form" id = "QuickCode" action = "../MockLogin" method = "post"> -->
     	<form role = "form" id = "QuickCode" action = "../1414080902134" method = "post">
      	<div class="form-group">
      		<label for = "qc">Quick Code</label>
      		<br/>
	      	<input type = "text" id = "qc" name = "QuickCode"
                	placeholder="Enter Quick Code"/>
             	</div>
      	<div class = "form-group">
			<button type = "sumbit" class = "btn btn-default" 
					onclick = "quickget()">Get Note</button>
      	</div>
     	</form>
     </div>
	</div>
	
	<%
		if (session.getAttribute("label") != null) {
			note label = (note)session.getAttribute("label");
			out.append(
					"<div class = 'panel panel-success' style = 'float:left;width:80%;background:rgba(218, 238, 210, 0.48);'> " + 
						"<div class = 'panel-heading'>" + 
							label.getTitle() + 
						"</div>" +
						"<div class = 'panel-body'>" + 
								label.getContent() + 
						"</div>" + 
						"<div class = 'panel-footer' style = 'font-size:smaller;'>" + 
							"<div style = 'width : auto;float : left;'>QC:" + 
								label.getQuickCode() +
							"</div>" +
							"<div style = 'text-align : right;'>" + 
								label.getLastTime() + 
							"</div>" +
						"</div>" + 
					"</div>"
			);
			session.setAttribute("label", null);
			session.setAttribute("quickCode", null);
		}
	%>
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
			            str += "<br/>" +  i + "ãã" + resp[i]
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