
       $( "#login" ).submit(function() {
         $.ajax({ 
          dataType: "json", 
          url: "success.json", 
           success: function(data){
             alert(data.msg);
         },
          error: function (XMLHttpRequest, textStatus, errorThrown) { 
           alert("error"); 
                                        } 

     });
       });
 