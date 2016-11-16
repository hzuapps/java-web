<%@ page pageEncoding = 'utf-8'  %>
<!-- 发帖页面 -->
<html>
	<head>
		<title>发帖</title>
		<link rel='stylesheet' type='text/css' href='css/new_content.css'>
		<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
		<script type="text/javascript" src="js/new_content.js"></script>
	    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<link rel='stylesheet' href='css/new_content.css'>
	</head>
	<body>
		<div class="right-top" >
			<p align="right"><a href="home.jsp" >返回主页</a></p>
		</div>
		<h2 id="tip" >发表新帖</h2>
		<hr style="border-top:1px solid blue" >
		<div id="mid-block" >
			<form action='1414080902106' method="post">
				<div style="height:40px;">
					<input id="title" class='title-edit' name="title" type="text"
						onClick="hideTip()"
						onblur="outTitle()"
					><br>
					<div id="title-tip" class='title-tip' onClick="onTip()">请填写标题</div>
				</div>
				<textarea id="text" name='text'></textarea><br><br>
				<input id='send' class="btn btn-sm btn-primary" type='submit' value='发帖'>
			</form>
		</div>
	</body>
</html>