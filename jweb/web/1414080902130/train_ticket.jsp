<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head lang="zh-cn">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title></title>
</head>

<style type="text/css">
    body{
        background: #F0F0F0;
    }
    nav{
        font-size: 15px;
        font-family: ；
    }
    label {
        font-weight: 100;
    }
    form{
        margin-top: 60px;
    }
</style>
<body>

<nav class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand"><span class="glyphicon glyphicon-road"></span></a>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <a href="#">车票预订</a>
            </li>
            <li>
                <a href="#">我的订单</a>
            </li>
            <li>
                <a href="#">个人信息</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${Passenger.username != null}">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
           <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">                                                          
                    ${Passenger.username}
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">未完成订单</a></li>
                    <li><a href="#">已完成订单</a></li>
                    <li><a href="#">个人信息</a></li>
                    <li class="divider"></li>
                    <li><a href="#">退出</a></li>
                </ul>
            </li>
        </c:if>
        
        <c:if test="${Passenger.username == null}">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </c:if>
        </ul>
    </div>
</nav>

<form role="form" class="form-horizontal" action="TrainServlet" method="post"> 
     <div class="container-fluid">
        <div class="form-group">
           <div class="col-md-3" >
             <div class="panel panel-success">
                <div class="panel-heading">
                    <h2 class="panel-title" align="center">
                                                                                    车票查询
                    </h2>
                </div>
                <div class="panel-body">
                          <div class="form-group">
                              <div class="col-md-12" >
                                   <table class="table">
                                        <tr><td>出发地</td><td><input type="text" class="form-control" name="despartPlace"></td></tr>
                                        <tr><td>目的地</td><td><input type="text" class="form-control" name="destination"></td></tr>
                                        <tr><td>出发日</td><td><input type="text" class="form-control" name="despartDate"></td></tr>
                                        <tr><td>返程日</td><td><input type="text" class="form-control" name="returnDate"></td></tr>
                                   </table>
                                   <button type="submit" class="btn btn-success btn-block">查询</button>
                              </div>    
                          </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h2 class="panel-title" align="center">
                                                                                  车票预订
                    </h2>
                </div>
                <div class="panel-body">
                          <div class="form-group">
                              <div class="col-md-12" >
                                   <table class="table">
                                               <thead>
                                                  <tr>
                                                      <th>车次</th>
                                                      <th>出发地</th>
                                                      <th>目的地</th>
                                                      <th>出发时间</th>
                                                      <th>到达时间</th>
                                                      <th>商务座</th>
                                                      <th>一等座</th>
                                                      <th>二等座</th>
                                                      <th>无座</th>
                                                      <th>预订</th>
                                                  </tr>
                                               </thead>
                                               <tbody>
                                                   <c:forEach var="tra" items="${tra}">
                                                      <tr>
                                                          <td>${tra.trainID}</td>
                                                          <td>${tra.despartPlace}</td>
                                                          <td>${tra.destination}</td>
                                                          <td>${tra.despartTime}</td>
                                                          <td>${tra.arrivalTime}</td>
                                                          <td>${tra.businessSeat}</td>
                                                          <td>${tra.firstSeat}</td>
                                                          <td>${tra.secondSeat}</td>
                                                          <td>${tra.nullSeat}</td>
                                                          <c:if test="${tra.businessSeat != 0 || tra.firstSeat != 0 || tra.secondSeat != 0 || tra.nullSeat != 0}">
                                                              <td><button type="button" class="btn btn-success btn-block btn-sm">预订</button></td>
                                                          </c:if>
                                                      </tr> 
                                                   </c:forEach>
                                               </tbody>
                                    </table>
                              </div> 
                          </div>
                </div>
            </div>
        </div>
     </div>
</form>
</body>
<html>
