<%@ page pageEncoding = 'utf-8'  %>
<!-- 发帖页面 -->
<html>
	<%! String s = "请填写内容"; %>
	<head>
		<title>发帖</title>
		<link rel='stylesheet' type='text/css' href='context.css'>
		<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
		<script type="text/javascript" src="context.js"></script>
	</head>
	<body>
		<div>
			<h2>发表新帖</h2>
			<hr>
			<form>
				<div style='height:40px;'>
					<input id="title" class='title-edit' name="title" type="text" style="width:500;"
						onClick="hideTip()"
						onblur="outTitle()"
					><br>
					<div id="title-tip" class='title-tip' onClick="onTip()">请填写标题</div>
				</div>
				<textarea id='context' rows="10" cols="100"><%= s %></textarea><br><br>
				<input id='send' type='button' value='发帖' onClick="Submit()">
			</form>
		</div>
	</body>
</html>