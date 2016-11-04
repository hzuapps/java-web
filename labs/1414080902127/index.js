$( "#target" ).submit(function( event ) {
  alert( "Handler for .submit() called." );
  event.preventDefault();
}); 
//下列是录入成功
$.ajax({
  url: "success.json
}).done(function(data) {
  if ( console && console.log ) {
      console.dir(data);
      alert(data.msg);
    }
}); 