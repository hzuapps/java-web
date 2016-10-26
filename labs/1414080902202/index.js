$(function()
{
   $( "#button1" ).click(function() 
     {
      if ($("#textfield3").val() =="")
       {
        alert("Please input your name");
        return false;
       }  
      else if ($("#textfield4").val() =="")
       {
        alert("Please input you Password");
        return false;
        }   
      else
        {
         $( "#target" ).submit(function( event ) {
         alert( "Handler for .submit() called." );
         event.preventDefault();
           });
         } 
        $.ajax({
             url: "success.json"
               }).done(function(data) {
                 if ( console && console.log ) {
                  console.dir(data);
                  alert(data.msg);
                   }
               });
      });
    }); 