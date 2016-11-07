<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><!-- 设置浏览器文档模式为最高版本 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>个人信息表单提交</title>
    <script src="index.js"></script>
</head>
    <body>
        <div class="panel panel-success">
        <div class="panel-heading text-center"><h2>填写个人信息</h2></div>
        <div class="panel-body">
            <form id="formid" method="post">
            <div class="form-group">
                <label>你的姓名：</label><input type="text" class="form-control" id="userName" placeholder="请输入名字" onblur="checkName(this.id)"/>
            </div>
            <div class="form-group">
                <label>你的身份证号：</label><input type="text" class="form-control" id="userID" placeholder="请输入身份证号" onblur="checkID(this.id)"/>
            </div>
            <div class="form-group">
                <label>你的联系方式：</label><input type="text" class="form-control" id="userPhoneNum" placeholder="请输入手机号码" onblur="checkPhoneNum(this.id)"/>
            </div>
            <div class="form-group">
                <label>你的邮箱：</label><input type="text" class="form-control" id="userEmail" placeholder="请输入你的电子邮箱" onblur="checkEmail(this.id)"/>
            </div>
            <div class="form-group">
                <label>你的地址：</label><input type="text" class="form-control" id="userAddress" placeholder="请输入你的居住地址" onblur="checkAddress(this.id)"/>
            </div>
            <div class="text-center">
            <input type="button" class="btn btn-success" value="提交信息"  onclick="formSubmit.Deal()" />
            </div>
            </form>
        </div>
        </div>
    </body>
</html>
