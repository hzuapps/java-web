<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<title>汽车4S店管理系统</title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

		<!-- 可选的Bootstrap主题文件（一般不用引入） -->
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<meta charset="utf-8">
		<script src="index.js" type="text/javascript"></script>
		<script language="javascript">
			function cancle(){
				window.alert("成功取消");
			}
		</script>
	</head>
	<body>
		<h3 align="center">创建客户订单</h3>
			<form name="cj" action="">
				<table>
					<tr><td>客户姓名：</td><td><input type="text" name="stuName"></td></tr>
					<tr><td>客户电话：</td><td><input type="text" name="phoneName"></td></tr>
					<tr><td>所购车辆：</td><td colspan="2"><input type="file"></td></tr>
					<tr><td>付款情况：</td>
						<td colspan="2">
							<input type="checkbox" name="yes">已付款
							<input type="checkbox" name="no">未付款
							</td>
						</tr>
						<tr><td>
						<input type="submit"  id="save"  value="保存">
						</td>
						<td><button type="button" onclick="cancle()">取消</button></td>
						</tr>
				</table>
			</form>
			
	</body>
</html>