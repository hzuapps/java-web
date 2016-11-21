<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>air conditioner</title>
<style type="text/css">
/*去除浏览器默认样式*/
input[type=range] {
    -webkit-appearance: none;
    width: 300px;
    border-radius: 10px; /*这个属性设置使填充进度条时的图形为圆角*/
}

/*滑轨样式*/
input[type=range]::-webkit-slider-runnable-track {
    height: 10px;
    border-radius: 10px; /*将轨道设为圆角的*/
    box-shadow: 0 1px 1px #def3f8, inset 0 .125em .125em #0d1112; /*轨道内置阴影效果*/
    background: #C1E3EF;
    width:500px;
}   

/*滑块样式*/
input[type=range]::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 20px;
    width: 20px;
    margin-top: -5px; /*使滑块超出轨道部分的偏移量相等*/
    background: #ffffff; 
    border-radius: 50%; /*外观设置为圆形*/
    border: solid 0.125em rgba(205, 224, 230, 0.5); /*设置边框*/
    box-shadow: 0 .125em .125em #3b4547; /*添加底部阴影*/
}

/*获得焦距时去除外边框*/
input[type=range]:focus {
    outline: none;
}

h1 {
  margin-top: 50px;
  margin-bottom: 50px;
  font-size: 50px;
}


body {
  font-family: 'Microsoft YaHei';
}

form {
  width:600px;
  height: 400px;
  margin-left: auto;
  margin-right: auto;
  padding-top: 50px;
}

.form-group {
  font-size:25px;
  margin-bottom:25px;
}

button {
    width: 200px;
    height: 40px;
    margin-left: 150px;
    margin-top:10px;
    border-radius: 20px;
    background: -webkit-gradient(linear, 0 0, 0 100%, from(#6BD9D4), to(#4BBFA5));
    color: white;
    font-size: 18px;
    outline: none;
}
</style>
</head>
<body>
  <h1 align="center">welcome to the control page of air conditioner!</h1>
  <p align="center"><%=new Date()%></p>
  <hr width="100%" size="2">
  <form role="form" method="post" action="Set_cussess">
    <div class="form-group">
      <label for="temperature ">temperature&nbsp&nbsp&nbsp</label>
      <input type="range" class="form-control" id="temperature">
    </div>
    <div class="form-group">
      <label for="wind-power">&nbspwind power&nbsp&nbsp&nbsp</label>
      <input type="range" class="form-control" id="wind-power">
    </div>
  
   <div class="form-group">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<label for="pattern">pattern</label>
      &nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" name="pattern" value="efficient" checked="checked"/><span>efficient</span>
      &nbsp&nbsp&nbsp&nbsp<input type="radio" name="pattern" value="nomal"/><span>nomal</span>
   </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</body>

<html>