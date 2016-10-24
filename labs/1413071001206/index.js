$(function(){
    $( ".btn" ).click(function( event ) {
  alert( "确定" );
  $.ajax({
  url: "ok.json"
}).done(function(data) {
  if ( console && console.log ) {
      console.dir(data);
      alert(data.msg);
    }
});
  event.preventDefault();
});
}) 