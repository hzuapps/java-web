<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品类别管理</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$(".button").click(function() {
			var a = $(".button").index(this);
			$(".hehe").css("display", "none");
			$(".hehe").eq(a).css("display", "block");
		});
	});
</script>
<body>
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;" id="main"
		align="center">
	<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-default button">查看商品类别</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-default button">添加商品类别</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-default button">删除商品类别</button>
  </div>
</div>
	<div class="hehe"
		style="width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
		<div class="list-group">
			<a href="#" class="list-group-item">日用品 </a> <a href="#"
				class="list-group-item">零食</a> <a href="#"
				class="list-group-item">饮料</a>
		</div>
	</div>
	<div class="hehe"
		style="display: none; width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
		<form role="form">
			<div class="form-group .col-md-5">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<label for="exampleInputEmail1">商品类别</label> <input type="email"
							class="form-control" id="exampleInputEmail1" placeholder="Enter">
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-default">添加</button>
		</form>
	</div>
	<div class="hehe"
		style="display: none; width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<%
					for (int i = 0; i < 3; i++) {
				%>
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox" id="<%="a" + i%>">
							类别<%=i%>
						</label>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">删除</button>
				</div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>