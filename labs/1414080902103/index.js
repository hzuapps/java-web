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
            alert("������"+data.name+"ѧ�ţ�"+data.id+"���ڣ�"+data.date+"��ע��"+data.note);
        }
        });
}
 




formSubmit=new FormSubmit();