<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", -10);
%>
<html>
<head>
<title>图书类别管理</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	var str = null;
	var url="<%=request.getContextPath()%>/1414080902119";
	var aBtn = document.getElementsByClassName('btn1 btn btn-default button');
	var aDiv=document.getElementsByClassName("hehe");
	window.onload = function() {
		aBtn[0].onclick=function()
		{
			ajax(url,addElement);
			showDiv(aBtn[0]);
		}
		aBtn[1].onclick=function()
		{
			showDiv(aBtn[1]);
			var addBtn=document.getElementById('addBtn');
			addBtn.onclick=function(){
				var url="<%=request.getContextPath()%>/1414080902119";
				data="operate=add&name="+document.getElementById('types_name').value;
				ajax(url,afterAdd,data);
			}
		}
		aBtn[2].onclick=function()
		{
			ajax(url,showDeleteList);
			showDiv(aBtn[2]);
		}
	}
	
	/*
	* 将通过ajax获取的数据进行处理
	*/
	function showDeleteList(json)
	{
		var oDiv=document.getElementById("delete_selected");
		var oExample=document.getElementsByClassName("delete_item")[0];
		oDiv.innerText="";
		var flag=false;
		for(var aaa in json)
		{
		   flag=true;
		   var a=oExample.cloneNode(true);
		   var b=a.getElementsByTagName("span")[0];
		   b.setAttribute("bookType",aaa);
		   b.innerText=aaa;
		   oDiv.appendChild(a);
		}
		
		var btn=document.getElementById("btn_delete");
		if(!flag)btn.disabled="disabled";
		else btn.disabled="";
		var arr="";
		btn.onclick=function()
		{
			arr="";
			var aCheckbox=document.getElementsByClassName("delete_item_value");
			for(var i=0;i<aCheckbox.length;i++)
			{
				if(aCheckbox[i].checked)
				{
					var oSpan=aCheckbox[i].parentElement.getElementsByTagName("span")[0];
					arr+=oSpan.innerText+",";
				}
			}
			arr=arr.substring(0,arr.length-1);
			var url="<%=request.getContextPath()%>/1414080902119";
			data="operate=delete&name="+arr;
			ajax(url,showDeleteList);
			ajax(url,afterDelete,data);
		}
	}
	
	/*
	*点击添加图书类别后处理ajax数据
	*/
	function afterAdd(json)
	{
		alert(json.msg);
		ajax(url,addElement);
		showDiv(aBtn[0]);
	}
	
	function afterDelete(json)
	{
		alert(json.msg);
		ajax(url,addElement);
		showDiv(aBtn[0]);
	}
	
	
	/**
	*显示某个板块，并且将其他板块隐藏
	*/
	function showDiv(btn)
	{
		var j=0;
		for(var i=0;i<aBtn.length;i++)
		{
			aDiv[i].style.display="none";
			if(btn==aBtn[i])j=i;
		}
		aDiv[j].style.display="block";
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
			<div class="btn-group">
				<button id="btn2" type="button" class="btn1 btn btn-default button">添加图书类别</button>
			</div>
			<div class="btn-group">
				<button id="btn3" type="button" class="btn1 btn btn-default button">删除图书类别</button>
			</div>
		</div>
		<div class="hehe"
			style="width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
			<div class="list-group" id="top">
			</div>
		</div>
		<div class="hehe"
			style="display: none; width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
			<form role="form" action="1414080902119?operate=add">
				<div class="form-group .col-md-5">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<label for="exampleInputEmail1">图书类别</label> 
							<input  id="types_name" type="text" class="form-control" placeholder="Enter"  name="name" >
						</div>
					</div>
				</div>
				<button id="addBtn" type="button" class="btn btn-default">添加</button>
			</form>
		</div>
		<div class="hehe"
			style="display: none; width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
			<form class="form-horizontal" role="form">
				<div class="form-group" id="delete_selected">
					<div class="col-sm-offset-2 col-sm-10 delete_item"   name="delete_item">
						<div class="checkbox">
							<label> <input name="hehe" type="checkbox" class="delete_item_value">
								<span></span>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-default" id="btn_delete">删除</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-offset-2 col-sm-10 delete_item" name="delete_item" style="visibility: hidden;">
		<div class="checkbox">
			<label> <input type="checkbox" class="delete_item_value">
				<span></span>
			</label>
		</div>
	</div>
</body>
</html>