<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="index.js" type="text/javascript"></script>
  <style type="text/css">  
    #preview, .img, img{width:200px;height:200px;}  
    #preview {border:1px solid #000;}  
  </style>  

  <title>报修表</title>
</head>
<body>
  <h1 align="center">报修信息</h1>
  <form role="form" id="target" class="form-horizontal" action="<%=request.getContextPath() %>/1414080902107" method="post">
    <div class="form-group">
      <label for="inputName" class="col-sm-4 control-label">报修人</label>
      <div class="col-xs-5">
        <input type="text" class="form-control" id="inputName" name="name" placeholder="输入姓名">
      </div> 
    </div>
    <div class="form-group">
      <label for="inputPhoneNumber" class="col-sm-4 control-label">联系方式</label>
      <div class="col-xs-5">
        <input type="Tel" class="form-control" id="inputPhoneNumber" name="phone" placeholder="输入手机号码" pattern="\d{11}"> 
      </div>  
    </div>
    <div class="form-group">
      <label for="inputPosition" class="col-sm-4 control-label">报修地点</label>
      <div class="col-xs-5">
        <input type="" class="form-control" id="inputName" name="position" placeholder="输入报修地点，如10#A101,1-101">
      </div>
    </div>
    <div class="form-group">
      <label for="inputDescription" class="col-sm-4 control-label">详细情况</label>
      <div class="col-xs-5">
        <textarea class="form-control" rows=5 id="inputDescription" name="description" placeholder="描述报修设备详情情况"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label for="inputImage" class="col-sm-4 control-label">上传图片</label>
      <div class="col-xs-5">
        <div id="preview"></div>  
        <input type="file" onchange="preview(this)">  
      </div>
    </div>
    <div class="checkbox">
      <label class="col-sm-4 control-label"></label>
      <input type="checkbox">影响较大，尽快维修
    </div>
    <div>
      <label class="col-sm-4 control-label"></label>
      <button type="submit" class="btn btn-default">提交</button>
    </div>
  </form>
</body>
</html>

