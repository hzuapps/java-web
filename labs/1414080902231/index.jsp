<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>		
		<meta charset="utf-8">
		<title>javaweb 实验二</title>

		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
		<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="index.js"></script>
		
	</head>
	<body>
		<%=new java.util.Date().toLocaleString() %>
		<p style=""><b>发布二手货物</b></p>
		<form  id="fm" action="rece.jsp" method="post">
		  <div class="form-group">
		    <p><label for="GoodsName">Goods Name</label><span style="color:red" id="p1"></span></p>
		    <input type="text"  id="GoodsName" name="GoodsName" placeholder="Goods Name" style="width:320px"/>
		  </div>
		  <div class="form-group">
		    <p><label for="Detail">Detail</label><span style="color:red" id="p2"></span></p>
		     <textarea name="Detail" id="Detail" cols="50" rows="10" placeholder="Detail"></textarea>
		  </div>		 
		  <div class="form-group">
		    <p><label for="imgfile">Pictures input</label><span style="color:red" id="p3"></span></p>
		    <input name="imgfile" type="file" id="imgfile" accept="image/*">
		  </div>
		</form>
		
		<button type="submit" onclick="fun()">submit</button>
	</body>	
	
	
	<script type="text/javascript" >
  		
  		function fun(){
			if(document.getElementById("GoodsName").value=='')
				document.getElementById("p1").innerHTML="* not null";
				
			if(	document.getElementById("Detail").value=='')
				document.getElementById("p2").innerHTML="* not null";
				
			if(	document.getElementById("imgfile").value=='')
			   document.getElementById("p3").innerHTML="* not null";
			else
				document.getElementById("fm").submit();
		}
  </script>
	


	
</html>