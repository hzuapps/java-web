<%@ page language="java" import="java.util.*" import="java.text.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
   <meta charset="UTF-8">
   <% SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
 out.println(format.format(new Date()));%>
    <title>比赛节目喜好调查</title>
    
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
  

  </head>  
  <body> 
     <% 
     Date date = new Date();
     date.getTime() ;
    %>

   <h3 align="center">比赛节目喜好调查</h3>
     <form  name="stu" action=""> 
      <table> 
       
       <tr> <td>性别：</td>
           <td><input type="radio" name="stuSex" checked="checked" >男 
               <input type="radio" name="stuSex" >女
           </td>
       </tr> 
       <tr> <td>出生日期</td> 
          <td><input type="text" name="stuBirthday" class="form-control"></td> 
       </tr> 
       <tr> <td>职业：</td><td><input type="text" name="jobs" class="form-control"></td></tr> 
       <tr><td>偏好：</td>
          <td><select name ="stuSelect2">
                <option selected>篮球</option>
                <option >足球</option>   
                <option >拳击</option>
                <option >游戏竞技</option>
             <lect>
          </td>
       </tr> 
       <tr> <td>平时有看：</td>
           <td colspan="2">
              <input type="checkbox" name="stuCheck" >NBA
              <input type="checkbox" name="stuCheck" >欧冠
              <input type="checkbox" name="stuCheck" >WWE
              <input type="checkbox" name="stuCheck" >LOL比赛
          </td>
       </tr> 
       
       <tr><td>您的建议：</td>
          <td colspan="2"><textarea name="Letter" rows="4" cols="40" class="form-control"></textarea> </td>
       </tr> 
       <tr>
         <td><button type="button" class="btn btn-default">提交</td>
         <td><input type="reset" value="取消"></td>
       </tr> 
     </table> 
   </form> 
  </body>
 	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $( ".btn" ).click(function() {
        $.ajax({ 
          url: "servlet/Se1414080902222Servlet",
          type : "get",
          datatype:"html",
          success: function(data){
            alert(data);
        }});
      });
    </script>


</script>
</html>