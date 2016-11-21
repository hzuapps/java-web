<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.*" %>
<%@page import="java.util.Date,java.lang.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>填写综合测评信息</title>
	<style type="text/css">
		
		#tb{	
  			border-collapse:collapse; /*//设置单边框*/
		}
		td{
			text-align:center;
		}
		
		body{
			background:#777;
			
		}
		
		input{
			background-color: #666;
			border:none;
			border-radius:10px;
			text-align:center;
			width:150px;
		}
		
		textarea{
			background-color: #666;
			border:none;
			border-radius:8px;
			text-align:center;
		}
		
		
	</style>

  </head>
  
  <body>
  	
  		<%!Date date=new Date(); %>
      	<%!DateFormat df= DateFormat.getDateTimeInstance(); %>
      	<% String username=(String)session.getAttribute("user");  %>
                	           
  	<div class="row"> 
      <div class="col-md-8"></div>
      <div class="col-md-4">
        <div class="col-md-6">
        	<button type="button" class="btn btn-info">
  				<span class="glyphicon glyphicon-time"></span> <%=df.format(date) %>
			</button>
        </div>
        <div class="col-md-4">
            <button type="button" class="btn btn-info btn-sm">
                <span class="glyphicon glyphicon-user"></span> 
                <label>你好！<%if(username!=null)out.write(username);%>,欢迎登录</label>
            </button>
        </div>
        <div class="col-md-2"></div>
      </div>
	</div>
    <br><br><br><br>
    <div class="row" id="div1">
    	<div id="div1" class="col-md-12">
	        <form id="form1" action="<%=request.getContextPath() %>/UpdateGrades" method="post">
	        	<div >
	        		<table id="tb" class="table table-bordered">
	        			<tr><td>课程名</td><td>成绩</td></tr>
	        			<c:forEach var="grade" items="${gradesList }">
	        				<tr>
	        					<td>${grade.courseName }</td>
	        					<td><input type="text" value=""></td>
	        				</tr>        			
	        			</c:forEach>
	        		</table> 		
	        	</div>
	        	<div style="text-align:right"><button type="submit" id="sub" class="btn btn-success">保存</button></div>
	        </form>
	        <br><br><br>
	    </div>
	    
  		<div class="col-md-12">
  			<form action="<%=request.getContextPath() %>/GetAwards" method="post">
	  			<table class="table table-bordered" id="awardTable">
	  				<tr><td>序号</td><td>奖励名称</td><td>获奖时间</td><td>名次</td><td>奖励描述</td></tr>
	  				<tr id="Acol1">
	  					<td id="Acol10">1</td>
	  					<td ><textarea id="Acol11" name="Acol11"></textarea></td>
	  					<td ><textarea id="Acol12" name="Acol12"></textarea></td>
	  					<td ><textarea id="Acol13" name="Acol13"></textarea></td>
	  					<td ><textarea id="Acol14" name="Acol14"></textarea></td>	
	  				</tr>
	  				
	  				<tr id="Acol2">
	  					<td id="Acol20" name="Acol20">2</td>
	  					<td ><textarea id="Acol21" name="Acol21"></textarea></td>
	  					<td ><textarea id="Acol22" name="Acol22"></textarea></td>
	  					<td ><textarea id="Acol23" name="Acol23"></textarea></td>
	  					<td ><textarea id="Acol24" name="Acol24"></textarea></td>	
	  				</tr>
	  				
	  				<tr id="Acol3">
	  					<td id="Acol30" name="Acol30">3</td>
	  					<td ><textarea id="Acol31" name="Acol31"></textarea></td>
	  					<td ><textarea id="Acol32" name="Acol32"></textarea></td>
	  					<td ><textarea id="Acol33" name="Acol33"></textarea></td>
	  					<td ><textarea id="Acol34" name="Acol34"></textarea></td>	
	  				</tr>
	  			</table>
	  			<div style="text-align:right"><button type="submit" id="sub1" class="btn btn-success">保存</button></div>		
	  		</form>				
	  			
  			
  			<br><br><br>
  		</div>
  		
  		
  		
  		<br><br>
  		<div class="col-md-12">
  			<table class="table table-bordered" >
  				<tr><td>序号</td><td>处罚名称</td><td>处罚时间</td><td>处罚原因</td><td>处罚结果</td></tr>
  				<tr>
  					<td>1</td>
  					<td><textarea id="punish11" name="punish11"></textarea></td>
  					<td><textarea id="punish12" name="punish12"></textarea></td>
  					<td><textarea id="punish13" name="punish13"></textarea></td>
  					<td><textarea id="punish14" name="punish14"></textarea></td>
  				</tr>
  			</table>
  			<div style="text-align:right;"><button type="button" id="sub2" class="btn btn-success">保存</button></div>
  		</div>
	</div>
	
    
    <script type="text/javascript">
    	
    		$(function(){
    			var name="subject";
    			var index=0;
    			$(":text").each(function(){
    		
    				$(this).attr("name",name+index).attr("id",name+index);
    				//alert($(this).val());
    				index++;
    			});
    			
    			var id="Acol";
    			var j=4;
    			var i=0;
    			var table=$("#awardTable");
    			$("#Acol34").change(function(){
    				var temp=$("<tr></tr>");
    				temp.appendTo(table);
    				var first=$("<td></td>").attr("id",id+j+i).text(j).attr("name",id+j+i);
    				first.appendTo(temp);
    				for(i=1;i<4;i++)
    				{
    					var t= $("<td></td>");
    					t.appendTo(temp);
    					var textarea=$("<textarea></textarea>").attr("id",id+j+i).attr("name",id+j+i);
    					textarea.appendTo(t);
    				}
    				var lastTd=$("<td></td>");
    				lastTd.appendTo(temp);
    				var textarea=$("<textarea></textarea>").attr("id",id+j+i).attr("name",id+j+i);
    				textarea.appendTo(lastTd);
    			});
    			
    			});
    </script>
  </body>
</html>
