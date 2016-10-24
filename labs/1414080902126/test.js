function test(){
    window.alert("注册成功！");
    }
jQuery(document).ready(function(){
    $(".btn").click(function(event){
        $.ajax({
             url: "success.json"
        }).done(function(data) {
            if ( console && console.log ) {
                alert(data.msg);
            }
        })
    });
});