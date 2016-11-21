<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 

	<meta name="viewport" content="width=device-width,initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="IE-edge"> 
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"> 
   <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> 

   <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
   <script src="index.js"></script> 
   
    <style>
    #login_panel
    {
    width: 302px;
    height: 200px;
    top: 92px;
	left:500px;
    background-color: rgba(0,0,0,0.05);
    position: relative;
    border-radius: 5px;
    border: 1px solid rgba(201,201,201,0.5);
    float: none;
    padding-left: 80px;
    padding-right: 35px;
    padding-top: 45px;
    }
    .uk-margin {
        margin-bottom: 20px;
		
    }
   
.uk-button {
    -webkit-appearance: none;
    margin: 0;
    overflow: visible;
    font: inherit;
    color: #FFFFFF;
    text-transform: none;
    display: inline-block;
    box-sizing: border-box;
    padding: 0 12px;
    background: #000000;
    vertical-align: middle;
    line-height: 28px;
    min-height: 30px;
    font-size: 12px;
    text-decoration: none;
    text-align: center;
    border: 1px solid rgba(0, 0, 0, 0.06);
    border-radius: 4px;
}
.uk-button-small {
    min-height: 25px;
    padding: 0 10px;
    line-height: 21px;
    font-size: 12px;   
    </style>

</head>
<body>
<%
   Cookie cookie = null;
   Cookie[] cookies = null;
   // 获取cookies的数据,是一个数组
   cookies = request.getCookies();
   if( cookies != null ){
      for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];
	         if((cookie.getName()).equals("name")){
	        	String name = cookie.getValue();
	        	request.setAttribute("name",name);
	        	break;
	         }
         }
   }
%>

<div style="float:right;">
<c:if test="${!empty name}">
	<a class='uk-button uk-button-small' href='#'><c:out value="${name}"/></a>
</c:if>
<c:if test="${empty name}">
	<a class='uk-button uk-button-small' href='login.jsp'>登录</a>
</c:if>
</div>
<div id="login_panel">
   <form action="1414080902240" method="post" enctype="multipart/form-data">
   <div class="uk-margin" style="text-align:?center;" >
            <h3 style="color:red;">
                        分享你的音乐</h3>
        </div>
     <input type="file" name="music" />
	 </br>
     <input type="submit" placeholder="上传" name="submit" value="上传"  />
</form>
 <a href="show.jsp">歌曲列表</a>
</div>


</body></html>