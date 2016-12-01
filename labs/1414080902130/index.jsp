<%@page contentType="text/html" import="java.util.*" pageEncoding="utf-8" %>
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
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <title></title>
</head>

<style type="text/css">
    body{
        background: #F0F0F0;
    }

    nav{
        font-family: STXingkai;
        font-size: 17px;
    }
    label {
        font-weight: 100;
    }
    form{
        margin-top: 60px;

    }
</style>
<script>
     $(function() {

            $.datepicker.regional["zh-CN"] = { closeText: "关闭", prevText: "&#x3c;上月", nextText: "下月&#x3e;", currentText: "今天", monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"], monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"], dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"], dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"], dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"], weekHeader: "周", dateFormat: "yy-mm-dd", firstDay: 1, isRTL: !1, showMonthAfterYear: !0, yearSuffix: "年" }
            $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);
            var datePicker = $("#ctl00_BodyMain_txtDate").datepicker({
                showOtherMonths: true,
                selectOtherMonths: true            
            });

        });
    $( function() {
        $( ".datepicker" ).datepicker();
    } );
</script>

<body>

<nav class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">火车票订票服务中心</a>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <a href="#">车票预定</a>
            </li>
            <li>
                <a href="#">余票查询</a>
            </li>
            <li>
                <a href="#">信息查询</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>

<form role="form" class="form-horizontal">

    <div class="form-group">
        <label class="control-label col-md-1">出发地</label>
        <div class="col-md-2" >
            <input type="text" class="form-control" >
        </div>
        <label class="control-label col-md-1">目的地</label>
        <div class="col-md-2" >
            <input type="text" class="form-control" >
        </div>
    </div><br>

    <div class="form-group">
        <label class="control-label col-md-1">出发日</label>
        <div class="col-md-2">
            <input type="text" class="form-control datepicker">
        </div>
        <label class="control-label col-md-1">返程日</label>
        <div class="col-md-2">
            <input type="text" class="form-control datepicker">
        </div>
    </div><br>

    <div class="form-group">
        <label  class="control-label col-md-1">发车时间</label>
        <div class="col-md-2">
            <select class="form-control">
                <option>00:00-24:00</option>
                <option>00:00-06:00</option>
                <option>06:00-12:00</option>
                <option>12:00-18:00</option>
                <option>18:00-24:00</option>
            </select>
        </div>
    </div><br>

    <div class="form-group">
            <label class="control-label col-md-1">车次类型</label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">GC-高铁
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">D-动车
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">Z-直达
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">T-特快
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">K-快速
            </label>
            <label class="control-label col-md-1">
                <input type="checkbox" value="train">其它
            </label>
    </div><br>

    <div class="form-group">
        <label class="control-label col-md-1">优先车次</label>
        <label class="control-label col-md-1">
            <input type="checkbox" value="seat">商务座
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" value="seat">一等座
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" value="seat">二等座
        </label>
        <label class="control-label col-md-1">
            <input type="checkbox" value="seat">无座
        </label>
    </div><br><br>

    <div class="col-md-1 col-md-offset-3">
        <button type="submit" class="btn btn-success">查询</button>
    </div>
</form>

</body>
<html>
