 $(function()
    {

         $( "button" ).click(function() 
      {
        if ($("#Username").val() =="")
        {
             alert("Please input Username");
             return false;
        }  
        else if ($("#Email").val() =="")
        {
            alert("Please input Email");
            return false;
        }
        else if ($("#Password").val() =="")
        {
            alert("Please input Password");
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