
function submitform(form){
    if(form.count.value=='') {
                alert("请输入用户帐号!");
                form.count.focus();
                return false;
           }
       if(form.password.value==''){
                alert("请输入登录密码!");
                form.password.focus();
                return false;
         }
        form.action="index.html";
        form.submit();
}
function test(){
    alert("test");
}