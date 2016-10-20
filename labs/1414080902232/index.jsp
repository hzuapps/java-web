<!DOCTYPE html>
<html>
<head>
	<meta charset="gb2312"> 
	<title></title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="1414080902232.js"></script>
</head>
<body>
<center>Now time is: 
        <%=new java.util.Date()%>
        </center>
<form role="form">
	<div class="form-group">
		<label for="name">名称</label>
		<input type="text" class="form-control" id="name" 
			   placeholder="请输入生物名称">
	</div>
	<div class="form-group">
		<label for="inputfile">请上传生物图片</label>
		<input type="file" id="inputfile">
		<p class="help-block">这里是块级帮助文本的实例。</p>
	</div>
	<div class="checkbox">
		<label>
			<input type="checkbox"> 请打勾
		</label>
	</div>
	<button id="sub"  type="button" class="btn btn-default">提交</button>
</form>
	
</body>
</html>