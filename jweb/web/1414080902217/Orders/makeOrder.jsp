<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>提交订单界面</title>
</head>

<body>
<p></p>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div class="text-center"><font size="5"face="微软雅黑">填写订单信息</font></div>
<div>&nbsp;</div>
<p></p>
<p></p>
<form action="register"method="post"class="form-horizontal" >
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">商品名:</label>
    <div class="col-xs-4">
      	<input type="text" class="form-control" name="goodsname" placeholder="商品名">
    </div>
  	</div>
	
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">商品价格:</label>
    <div class="col-xs-4 input-group">
      	<input type="text" class="form-control" name="goodsvalue" placeholder="商品价格">
      	<span class="input-group-addon">元</span>
    </div>
  	</div>
  	
  	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">下单时间:</label>
    <div class="col-xs-4 input-group">
      	<input type="text" class="form-control" name="year" placeholder="年">
      	<span class="input-group-addon">年</span>
      	<input type="text" class="form-control" name="month" placeholder="月">
      	<span class="input-group-addon">月</span>
      	<input type="text" class="form-control" name="day" placeholder="日">
      	<span class="input-group-addon">日</span>
    </div>
  	</div>
  	
  	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">送货时长:</label>
    <div class="col-xs-4 input-group">
      	<input type="text" class="form-control" name="time" placeholder="送货时长">
      	<span class="input-group-addon">天</span>
    </div>
  	</div>
  	
	<div class="form-group">
    <div class="row">
      <div class="col-xs-offset-5 col-xs-1"><button type="submit" class="btn btn-default">提交</button></div>
      <div class="col-xs-5"><a class="btn btn-default" href="/zhhao/select.jsp" role="button">返回</a></div>
    </div>
  	</div>
  	
</form>       
</body>
</html>
