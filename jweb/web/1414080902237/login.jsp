<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<title>鸡皮疙瘩图书馆</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js" type="text/javascript"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script type="text/javascript">
var account_name = "";

jQuery(document).ready(function($) {
	//记录各种信息
	var book_num = 0;
	var book_name = "";
	var book_author = "";
	var book_url = "";
	var book_id = 0;
	var ready_denglu = 0;
	var user_name = " ";

	

	$("#book").click(function(event) {
		$("#all_book_show").css('display','none');
		$("#borrow_book").css('display','none');
		$("#show_mybook").css('display','none');
		$("#character_introduction").css('display','none');
		$("#all").css({
			display: 'none'
		});
		$("#jumu").css({
			background: 'url("img/heheda.jpg")'
		});
		$("#hehe").css({
			display: 'block'
		});
		$("#show").css({
			display: 'none'
		});		
		$("#all").fadeIn("slow");
	});


	$("#continue").click(function(event) {
		$("#character_introduction").css('display','none');
		$("#show").css({
			display: 'none'
		});
		$("#hehe").fadeIn('slow');
	});
	
	
	
	//登录确定
	$("#ready").click(function(){
			var account = $("#recipient-name").val();
			var password = $("#message-text").val();
			$.ajax({
				url: 'http://localhost:8080/Library/Login',
				type: "GET",
				data: {
					account:account,
					password:password
				},
				success:function(data){
					var a = data;
					var arr = new Array();
					arr = a.split(" ");
					if(arr[0] == "true"){
						alert("登录成功！");
						$("#all_book_show").css('display','none');
						$("#borrow_book").css('display','none');
						$("#show_mybook").css('display','none');
						$("#character_introduction").css('display','none');
						$("#all").css({
							display: 'none'
						});
						$("#jumu").css({
							background: 'url("img/heheda.jpg")'
						});
						$("#hehe").css({
							display: 'block'
						});
						$("#show").css({
							display: 'none'
						});		
						$("#all").fadeIn("slow");
						account_name = account;
						user_name = arr[1];
						ready_denglu=1;
						$("#denglu").text("用户:"+user_name);
						
					}
					else{
						alert("账号或密码不正确！");					
					}
				},
				error:function(data)
				{
					alert("提交失败");
				}
			});		
	});
	

	//确认注册
	$("#register_page_ready").click(function(){
		var account = "",username = "",sex = "",password = "";
		account = $("#register_page_account").val();
		username = $("#register_pag_user_name").val();
		sex = $("#register_pag_sex").val();
		password = $("#register_pag_passwordr").val();
		alert(account + " " + username +" " + sex + " " + password);
		
		 $.ajax({
				url: 'http://localhost:8080/Library/create_user',
				type: "GET",
				data: {
					account:account,
					username:username,
					sex:sex,
					password:password
				},
				success:function(data){
					alert("注册成功！");
				} ,
				error:function(data)
				{
					alert("注册失败");
				}
			})
		
	})
	
	
	$("#searched").click(function(event) {	
		searching();	
	});

});
</script>
<title>example</title>
<style type="text/css">
	
	body {
  		position: relative;
  		overflow-x:hidden ;
	}

	a{
		text-align: center;
	}

	#jumu{
		height: 85%;
		background:url("img/heheda.jpg");
		background-attachment:fixed; 
		background-size: cover; 
		overflow: hidden;
	}

	#jumu2{
		height: 100%;
		background-color: rgba(225, 225, 225, 0.3);
	}

	#search{
		width:40%;
	}


	#jumu2 p,#jumu2 h1{
		color: white;	
	}

	#jumu2 p{
		margin-left: 1%; 
	}

	.actived{
		background-color: black;
	}

	#show{
		display: none;
		margin-left: 10%;
		text-align: center;
		margin-top: -6%;
	}

	#show p{
		display: block;
	}
	
	/*//右侧文字简介部分*/
	#character_introduction{
		
		display:none;
		width: 850px;
		height: 100%;
		/*border: 1px solid red;*/
		margin-left: 30%;
		background-color: rgba(255, 255, 255, 0.6);
		border-radius: 10px;
		padding-left: 1px;
		padding-right: 1px;
		padding-top:5px;
	}
	
	#character_introduction h3{
		font-weight: bold;
		padding-left:10px;	
	
	}

	#character_introduction p{
		color: black;
		font-size: 16px;
		font-family:楷体;
	}


</style>
</head>




<body scroll="auto">
	<!-- 头部菜单 -->
	<ul class="nav nav-tabs" class="well">
  		<li role="presentation" class="col-md-6" class="actived"><a href="#jumu" data-toggle="tab" id="book">找书</a></li>
  		<li role="presentation" class="col-md-6"><a href="#" data-toggle="modal" 
   			data-target="#myModal" id = "denglu">登录</a></li>
	</ul>

<!-- 找书页面-  -->
<div id="myTabContent" class="tab-content">
	<div id="all">
	<div class="jumbotron" class="tab-pane fade in active" id="jumu">
		<div class="jumbotron"  id="jumu2">
  			<div class="container" id="hehe">
  				<h1>鸡皮疙瘩图书馆</h1>
 				<p>欢迎你</p>
 				<div class="col-lg-6">
    				<div class="input-group">
      					<div class="input-group-btn">
        					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" 	aria-expanded="false">信息<span class="caret"></span></button>
        					<ul class="dropdown-menu">
          						<li><a href="#">更多功能敬请期待</a></li>
          						<li role="separator" class="divider"></li>
          						<li><a href="#">作者--温广</a></li>
          						<li><a href="#">软件工程2班</a></li>
          						<li><a href="#">学号:1414080902237</a></li>
        					</ul>
      					</div><!-- /btn-group -->
      					<input type="text" class="form-control" aria-label="..." id="search">
        				<button class="btn btn-default" type="button" id="searched">搜索</button>
    				</div><!-- /input-group -->
  				</div><!-- /.col-lg-6 -->
  			</div>
			
			
			</div>
		</div>
	</div>
	<div class="row">
 	<div class="tab-pane fade" id="home">
   </div>

    <div class="tab-pane fade" id="ios">
      <p>
      	
      </p>
   </div>
</div>

<!-- 登录页面 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               登录
            </h4>
         </div>
         <div class="modal-body">
            <form >
          		<div class="form-group">
            		<label for="recipient-name" class="control-label">账号:</label>
            		<input type="text" class="form-control" id="recipient-name">
          		</div>
          		<div class="form-group">
            		<label for="message-text" class="control-label">密码:</label>
            		<input type="password" class="form-control" id="message-text"></input>
          		</div>
        	</form>
         </div>
         <div class="modal-footer">
         <button type="button" class="btn btn-default" 
               data-dismiss="modal" id = "register" data-toggle="modal" data-target="#register_page">注册账号
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal" id = "ready">确认
            </button>
         </div>
      </div>
</div>
</div>


<!-- 注册页面 -->
<div class="modal fade" id="register_page" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
           		用户注册
            </h4>
         </div>
         <div class="modal-body">
            <form>
          		<div class="form-group">
            		<label for="recipient-name" class="control-label">账号:</label>
            		<input type="text" class="form-control" id="register_page_account" placeholder="">
          		</div>
           		<div class="form-group">
            		<label for="recipient-name" class="control-label">昵称:</label>
            		<input type="text" class="form-control" id="register_pag_user_name" placeholder="">
          		</div>
           		<div class="form-group">
            		<label for="recipient-name" class="control-label">密码:</label>
            		<input type="text" class="form-control" id="register_pag_passwordr" placeholder="">
          		</div>  
            	<div class="form-group">
            		<label for="recipient-name" class="control-label">性别:</label>
            		<input type="text" class="form-control" id="register_pag_sex" placeholder="">
          		</div>           		       		          		
        	</form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal" id = "register_page_ready">注册
            </button>
         </div>
      </div>
</div>
</div>



</body>
</html>