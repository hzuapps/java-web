<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>添加提交页面</title>
	</head>
	<style>
		table{
			margin-left:auto;
			margin-right:auto;
		}
		tr{
			text-align:center;
			bgcolor:cccccc;
		}
		hr{
			width:100%;
  			size:3;
		}
	</style>
	<body>
		请输入学生信息<hr>
		<form action="Insert" method="post">
			<table >
				<tr><td>学号</td><td><input type="text" name="id"></td></tr>
				<tr><td>姓名</td><td><input type="text" name="name"></td></tr>
				<tr><td>性别 </td><td>男<input type="radio" name="sex" value="男" checked="checked">
									  女<input type="radio" name="sex" value="女">
					</td></tr>
				<tr><td>年龄</td><td><input type="text" name="age"></td></tr>
				<tr><td>体重</td><td><input type="text" name="weight"></td></tr>
				<tr><td>身高</td><td><input type="text" name="hight"></td></tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="添加">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="取消">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>