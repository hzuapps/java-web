<!DOCTYPE html>
<html>
<head>
	<title> New Document </title> 


<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="index.js" type="text/javascript"></script>
<meta name="Generator" content="EditPlus"> 
<meta name="Author" content=""> 
<meta name="Keywords" content=""> 
<meta name="Description" content=""> 
<meta charset="utf-8"> 
<style type="text/css"> 
div{ width:35%;margin-left:32%;} 
</style> 
</head>
<body>
<div> 
<form class="f1" action="http://www.baidu.com" method="get" > 
<fieldset > 
<legend>表单的注册</legend> 
<table width=100% > 
<tbody> 
<tr ><td class=“left” width=40% align="right"><label for="t1">姓 名：</label></td> 
<td class="right"><input type="text" id="t1" name="Name"></td> 
</tr> 
<tr><td class=“left” width=40% align="right"><label for="Password1">密 码：</label></td> 
<td class="right"><input id="Password1" type="password" name="Password" /></td> 
</tr> 
<tr><td class=“left” width=40% align="right"><label for="e1">邮 箱：</label></td> 
<td class="right"><input type="email" id="e1" name="youxiang" ></td> 
</tr> 
<tr><td class=“left” width=40% align="right"><label for="1">性 别：</label></td> 
<td class="right"><input type="radio" id="1" name="ssex" value="nan" />男<!-- name设置成一样的就行了--> 
<input type="radio" id="2" name="ssex" value="nv" />女 
</td> 
</tr> 
<tr><td class=“left” width=40% align="right">地 区：</td> 
<td><select id="selc" name="place"> 
<option value="quanzhou">泉州</option> 
<option value="xiamen">厦门</option> 
<option value="zhangzhou" >漳州</option> 
</select> 
</td> 
</tr> 
<tr><td class=“left” width=40% align="right"><label for="txtarea">简 介：</label></td> 
<td><textarea id="txtarea"></textarea></td> 
</tr> 
<tr><td class=“left” width=40% align="right">兴 趣：</td> 
<td><input type="checkbox" id="cbox1" name="dushu" value="c1">读书 
<input type="checkbox" id="cbox2" name="yundong" value="c2">运动 
<input type="checkbox" id="cbox3"name="chihe" value="c3">吃喝 
</td> 
</tr>
<button type="button" id="sub" class="btn btn-default">确认</button>   
</tbody> 
</table> 
</fieldset> 
</form> 
</div> 
	
</body>
</html>
<script type="text/javascript">
	window.onload = function(){
$("#sub").click(function(event){
	$.ajax({
		type: "post", 
                                        url: "servlet/Se1413071001206Servlet", 
                                    //    data:{},
                                        dataType: "html", 
                                        success: function (data) { 
                                        	//   alert("yes");
                                                alert(data);
                                                //$("input#showTime").val(data[0].demoData); 
                                        }, 
                                        error: function (XMLHttpRequest, textStatus, errorThrown) { 
                                              alert(XMLHttpRequest.readyState);
                                              //  alert(arguments[2]); 
                                        } 
	})
});
}
</script>