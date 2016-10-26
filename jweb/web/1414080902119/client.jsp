<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	var str = null;
	var url="../1414080902119";
	var aBtn = document.getElementsByClassName('btn1 btn btn-default button');
	var aDiv=document.getElementsByClassName("hehe");
	window.onload = function() {
		aBtn[0].onclick=function()
		{
			ajax(url,addElement);
		}
	}
	
	/* 
	* 将json数据转化为标签
	*/
	function addElement(json)
	{
		var oDiv=document.getElementById("top");
		oDiv.innerText="";
		for(var a in json)
		{
			var oA=document.createElement("a");
			oA.className="list-group-item";
			oA.innerText=a;
			oDiv.appendChild(oA);
		}
	}
	/*
	* url请求地址
	* doSome方法对json数据进行处理
	* ajax获取数据
	*/
	function ajax(url,doSome,data) {
		var xmlHttpRequest = null;
		try {
			xmlHttpRequest = new XMLHttpRequest();
		} catch (e) {
			xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
		}
		xmlHttpRequest.open('post', url+'?' + new Date().getTime(),
				true)
		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
		xmlHttpRequest.send(data);
		xmlHttpRequest.onreadystatechange = function() {
			if (xmlHttpRequest.readyState == 4) {
				if (xmlHttpRequest.status == 200) {
					str = xmlHttpRequest.responseText;
					var json=eval('('+str+')')
					doSome(json);
				} else {
					alert("出错了");
				}
			}
		}
	}
</script>
<body>
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;" id="main"
		align="center">
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button id="btn1" type="button" class="btn1 btn btn-default button">查看图书类别</button>
			</div>
		</div>
		<div class="hehe"
			style="width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
			<div class="list-group" id="top">
			</div>
		</div>
	</div>
</body>
</html>