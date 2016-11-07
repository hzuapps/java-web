<%@ page pageEncoding = 'utf-8'  %>
<!-- 发帖页面 -->
<html>
	<head>
		<title>发帖</title>
		<link rel='stylesheet' type='text/css' href='css/content.css'>
		<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
		<script type="text/javascript" src="js/content.js"></script>
	</head>
	<body>
		<div>
			<h2>发表新帖</h2>
			<hr>
			<form action='1414080902106' method="post">
				<div style='height:40px;'>
					<input id="title" class='title-edit' name="title" type="text" style="width:500;"
						onClick="hideTip()"
						onblur="outTitle()"
					><br>
					<div id="title-tip" class='title-tip' onClick="onTip()">请填写标题</div>
				</div>
				<textarea id='content' name='content' rows="10" cols="100" style='width:500'></textarea><br><br>
				<input id='send' type='submit' value='发帖'>
			</form>
		</div>
	</body>
</html>