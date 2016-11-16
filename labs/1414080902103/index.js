FormSubmit.prototype.Deal=function()
{
    var message=
    {
       "name":$("#name").val(),
       "id":$("#id").val(),
       "date":$("#date").val(),
       "note":$("#note").val(),
       
   };

   
        $.ajax({
        method: "POST",
        url: "Se1414080902103Servlet",
        dataType:"json",
        data: message,
        success:function(data)
        {
            alert("姓名："+data.name+"学号："+data.id+"日期："+data.date+"备注："+data.note);
        }
        });
}
 




formSubmit=new FormSubmit();