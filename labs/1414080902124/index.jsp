<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/3
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>
        惠州学院毕业生就业信息管理系统
    </title>
    <style type="text/css">
        .center {
            margin-left: auto;
            margin-right: auto;
            width: 70%;
            /*background-color: #b0e0e6;*/
            text-align: center;
        }

        .input_location {
            width: 20%;
        }


    </style>


</head>
<body>
<h3 align="center">毕业生就业信息录入界面</h3>

<div class="center">
    <p>姓名：
        <input class="input_location" type="text" name="姓名">
    </p>

    <p>学号：
        <input class="input_location" type="text" name="学号">
    </p>

    <p>班级：
        <input class="input_location" type="text" name="班级">
    </p>

    <p>就职城市：
        <input class="input_location" type="text" name="就职城市"  >
    </p>

    <p>就职薪资：
        <select class="input_location" name="就职薪资">
            <option value="0-1000元">0-1000元</option>
            <option value="1000-2000元">1000-2000元</option>
            <option value="2000-3000元">2000-3000元</option>
            <option value="3000-4000元">3000-4000元</option>
            <option value="4000-5000元">4000-5000元</option>
            <option value="5000-6000元">5000-6000元</option>
            <option value="6000-7000元">6000-7000元</option>
        </select>
    </p>

    <input class="input_location" type="submit" name="提交" value="提交">
</div>
</body>
</html>
















