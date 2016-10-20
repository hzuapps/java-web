$(function(){
    $( "form" ).submit(function( event ) {
  alert( "注册成功！" );
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