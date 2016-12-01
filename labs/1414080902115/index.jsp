<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
  <head>
 <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.css" />
  
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-responsive.css" />
      <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-responsive.min.css" />
  <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  
    
    <title>惠州学院图书馆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	.control-group{
	margin-left:5%;
	margin-top: 5%;
	}
	a{
	color: black;
	font-weight: bold;
	}
	h3{
	font-size:18px;
	color: transparent;
   -webkit-text-stroke: 1px black;
   letter-spacing: 0.04em;
	}
	.ch>li{
	margin:12px;
    font-size: 18px;
	}
	</style>
	<script>
window.onload=function(){
//定时器每秒调用一次fnDate()
setInterval(function(){
fnDate();
},1000);
}
//js 获取当前时间
function fnDate(){
var oDiv=document.getElementById("div1");
var date=new Date();
var year=date.getFullYear();//当前年份
var month=date.getMonth();//当前月份
var data=date.getDate();//天
var hours=date.getHours();//小时
var minute=date.getMinutes();//分
var second=date.getSeconds();//秒
var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
oDiv.innerHTML=time;
}
//补位 当某个字段不是两位数时补0
function fnW(str){
var num;
str>10?num=str:num="0"+str;
return num;
} 
</script>
  <body>
  <div id="formbackground" style="position:absolute; width:100%; height:100%; z-index:-1">  
 <img src="image/15.jpg" height="100%" width="100%"/>  
 <script type="text/javascript">
$(function(){
    $('#formbackground').height($(window).height());
    $('#formbackground').width($(window).width());
});
function openpage(){
	document.write("!!!");
	window.location.href = "Search.jsp";
	//window.location.replace("Search.jsp");
	}
</script>

  </div>
   <div class="container">
	<div class="row">
		<div class="span12">
			<h1 class="text-center" style="font-size: 75px">
				惠州学院图书馆
			</h1>
		</div>
	</div>
	 <%
	 	Calendar rightNow = Calendar.getInstance();
 	 	Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
 	 	request.setAttribute("hour", Hour);
  	 %>
  	  <c:choose>
 		 <c:when test="${ hour >= 0 && hour <= 11}"><span>Good morning </span></c:when>
  		 <c:when test="${ hour >= 12 && hour <= 17}"><span>Good afernoon !</span></c:when>
 		 <c:otherwise><span>Good night, !</span></c:otherwise>
 	 </c:choose>
	<label style="margin-left: 70%;color: black;font-size: 20px;font: bold;">当前时间 : </label>
	<div  id="div1"  style="float:right;color: black;font-size: 20px;font: bold;">
	</div>
	<div class="row">
		<div class="span4" style="float:left;width: 20%" >
			<form class="form-horizontal" id="target" style="height: 250px;margin-top:2%" action="Second.jsp" method="get">
				<div class="control-group">
					<label class="control-label" for="inputEmail">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
					<div class="controls">
						<input id="inputEmail" type="text" name="username" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
					<div class="controls">
						<input id="inputPassword" type="password" name="userpwd" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls"  style="margin-left: 10%">
						<label class="checkbox"><input type="checkbox" /> 记住账户</label>
						 <button class="btn" type="submit"  style="margin-top: 10%">登陆</button>
					</div>
				</div>
			</form>
		</div>
		<div class="span4" style="float:left;width:55%;height: 265px;">
			<h3 style="margin:20px;" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本馆现馆舍于2003年投入使用，由华侨叶葆定先生和政府共同出资建成，遵照叶先生的意愿而命名为叶竹君图书馆，是惠州学院的文献信息资源中心与服务中心。

   经过30多年的发展，本馆已拥有丰富的文献信息资源，建立起种类齐全、内容丰富、结构合理、层次分明的文献信息资源保障体系。截至目前，馆藏总量（含电子文献）达251.32万册(件)，其中各类印刷型文献约152.21万册，
   电子图书99.11万册，引进和自建大型数据库近30个。建有高速局域网，采用图书馆自动化管理系统，并加入了中国高等教育文献保障体系(CALIS)、中国高校人文社会科学文献中心（CASHL）、广东省文献资源共建共享协作
   网等文献保障体系，形成了便利的分布式数字化信息服务网络，实现了数据资源的共建、共知与共享。本馆总建筑面积约21000平方米，设有阅览座位2000多个。秉承“以人为本”的服务理念，构建灵活开放的服务格局。

			</h3>
		</div>
		<div class="span4" style="float:left;width:25%;height:265px">
			<form class="form-search" style="margin-left: 20px;margin-top: 10px" id="formsearch"   action="Search.jsp">
				<input class="input-medium search-query" type="text" /> 
				<button type="submit" class="btn"style="margin-left: 10px;" >
				查&nbsp;&nbsp;找</button>
				
			</form>
			
			<ul class="ch" style="float: left;">
			 <li><a href="http://seek.hzu.edu.cn/">馆藏书目</a></li>
            <li><a href="http://seek.hzu.edu.cn/book.htm?q=QK">馆藏期刊</a></li>
	    <li><a href="http://seek.hzu.edu.cn/book.htm?q=BZ">馆藏报纸</a></li>
            <li class="subLi"><a href="http://seek.hzu.edu.cn/class.htm">图书分类</a></li>
	    <li><a href="http://seek.hzu.edu.cn/publisher.htm">出版社</a></li>
          

			</ul>
			<ul class="ch" style="float: left;">
			  <li><a href="http://seek.hzu.edu.cn/author.htm">责任者</a></li>
            <li><a href="http://seek.hzu.edu.cn/annex.htm">随书附件</a></li>
            <li><a href="http://seek.hzu.edu.cn/new.htm">最新图书</a></li>
            <li><a href="http://seek.hzu.edu.cn/hot.htm">热门图书</a></li>
            <li><a href="http://seek.hzu.edu.cn/key.htm">热门搜索</a></li>
			
			</ul>
		
		</div>
	</div>
	<div class="row">
		<div class="span2" style="float:left;width: 20%">
			<ul class="nav nav-list" style="width:80%">
			 	<li class="nav-header" style="font-weight: bold;font-size: 20px;">
					    惠州学院图书馆
				</li>
				<li class="active">
					<a href="http://lib.hzu.edu.cn/about/2.html" >本馆概况</a>
				</li>
				<li>
					<a href="#">规章制度</a>
				</li>
				<li>
					<a href="#">新书推购</a>
				</li>
				
				<li class="nav-header" style="font-weight: bold;font-size: 20px;">
					     管理
				</li>
				<li>
					<a href="#">书籍资料</a>
				</li>
				<li>
					<a href="#">完善和建议</a>
				</li>
				<li class="divider">
				</li>
				<li>
					<a href="#">帮助</a>
				</li>
			</ul>
			
		</div>
		<div class="span6">
			<dl>
				<dt>
					巾帼概况：
				</dt>
				<dd>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书馆现有教职工52名，其中女教职工38名，占教职工总数的73%。其中具有硕士学位的女工1人，本科学历的有22人，专科学历的有9人；高级职称的女工有5人，
					其中正高1人，副高4 人；中级职称有14人，初级职称有7人。全馆上下团结互助，齐心协力，不断进取，积极投身于服务育人的工作中，在学院的教学、科研工作中起着重要作用。
					于2000年被评为校级“巾帼文明示范岗”，于2004年被评为市级“巾帼文明示范岗”，2008年被评为省级“巾帼文明示范岗”。
				</dd>
				<br>
				<dt>
					服务承诺：
				</dt>
				
				<dd>
					创立于1868年的万国表有“机械表专家”之称。
				</dd>
				   <p>1、岗位成员2008年度公开发表专业论文共计21篇，研究课题两项。</p>
  		<p>2、在学院开展的创建文明机关评选活动中连续两次获得第二名的好成绩。</p>
		<p>3、在校内各种歌唱、演讲、征文、体育等丰富多彩的文体比赛中，女工们均取得优秀成绩。</p>
		<p>4、我馆女工有四位是校舞蹈队队员，在参加国庆六十周年晚会节目中表现优秀，受到好评。</p>

			</dl>
		</div>
		
	</div>
</div>
 <script type="text/JavaScript" >
 $("#target").submit(function (event) {
	 var user = document.getElementById("inputEmail");
	var pwd= document.getElementById("inputPassword"); 
if(user.value.length>0&&pwd.value.length>0){
	//event.preventDefault();
    $.ajax({
            url: "success.json",
            dataType: "json",
            data:"{}",
            success: function (data) {
                // Play with returned data in JSON format
                alert(data.msg);
                
                return true;
            },
            error: function (msg) {
                alert("登陆失败");
                return false;
            }
        });
}else{
	alert("请输入用户名或密码");
	return false;
}	
});   
 

   
  </script>
  </body>
</html>