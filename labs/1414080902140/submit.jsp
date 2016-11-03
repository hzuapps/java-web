<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生体测信息</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script type="text/javascript">
function check(){
  for(var i=0;i<document.form1.elements.length-1;i++)
         {
          if(document.form1.elements[i].value=="")
          {
           alert("当前表单不能有空项，若该学生没有某项目的成绩，可设置该项目成绩为0");
           document.form1.elements[i].focus();
           return false;
          }
         }
         alert("提交成功");
        
  }
  
           

</script>
<style type="text/css">
body{
 background:  #FFFF77 ;

}

label{
  font-weight: 100px;
}
form{
  margin-right: 150px;
}
</style>
</head>
<body>
<br/><br/><br/><br/>
<div class="container">
  <div class="col-md-3"></div>
  <div class="col-md-6" style="padding: 10px;;background-color:  #FFFFBB">
    <h3 align="center">添加学生体测信息</h3><br/>
    <form name="form1" method="post" action="" class="form-horizontal">

      
       


         <div class="form-group">
             <label class="control-label col-md-6">学号：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control" >
             </div>
             </div>
          
          <div class="form-group" >
             <label class="control-label col-md-6">姓名：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">性别：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">年龄：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control" >
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">身高：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">体重：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">肺活量：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control" >
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">长跑：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="form-group">
             <label class="control-label col-md-6">短跑：</label>
             <div class="col-md-6">
                 <input type="text"  name="id"  class="form-control">
             </div>
             </div>
             <div class="">
             <label class="col-md-6"></label>
             <div class="col-md-6">
                 <input type="submit" value="提交" onclick="check()" >
                 <input type="reset" value="取消" style="float:right">
             </div>
             </div>
         

         </div>
   </form>
  </div>
  <div class="col-md-3"></div>
</div>
</div>

</body>
</html>