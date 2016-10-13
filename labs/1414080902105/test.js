$(function(){
   $( "form" ).submit(function( event ) {
   alert( "×¢²á³É¹¦£¡" );
       $.ajax({
  url: "success.json
}).done(function(data) {
  if ( console && console.log ) {
      console.dir(data);
      alert(data.msg);
     }
   });
 });
})
         