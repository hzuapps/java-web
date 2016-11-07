function checkName(x)
{
    var val = document.getElementById(x).value;
    //var val = $("#x").val();
    var reg = /^[\u4e00-\u9fa5]{2,4}$/;//匹配2~4个汉字

        if (!reg.test(val)) {

            alert("请输入真实姓名！");
           }
}

function checkID(x)
{
    var val = document.getElementById(x).value;
    //var val = $("#x").val();
    var reg = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;

    if (!reg.test(val))
    {
        alert("身份证号码不正确！");
    }
}

function checkPhoneNum(x)
{
    var val = document.getElementById(x).value;
    //var val = $("#x").val();
    var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;//匹配手机号

    if (!reg.test(val)) {
    alert("手机号码不正确！");
    }
}


function checkEmail(x)
{
    var val = document.getElementById(x).value;
    //var val = $("#x").val();
    var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;//匹配邮箱

    if (!reg.test(val)) {
        alert("邮箱格式不正确！");
    }
}

function checkAddress(x)
{
    var val=document.getElementById(x).value;
    //var val = $("#x").val();
    var reg=/^(\S{10,35})$/;//长度在10到35之间的不为空字符的字符串

    if(!reg.test(val))
    {
        alert("请输入正确的地址！");
    }

}


function FormSubmit()//构造函数
{

}


FormSubmit.prototype.Deal=function()
{
    var message=
    {
       "name":$("#userName").val(),
       "id":$("#userID").val(),
       "phoneNum":$("#userPhoneNum").val(),
       "email":$("#userEmail").val(),
       "address":$("#userAddress").val()
   };

    if(name!=""&&id!=""&&phoneNum!=""&&email!=""&&address!="")
    {
        $.ajax({
        method: "POST",
        url: "Se1414080902219Servlet",
        dataType:"json",
        data: message,
        success:function(data)
        {
            alert("姓名："+data.name+"身份证号："+data.id+"手机号："+data.phoneNum+"邮箱："+data.email+"地址："+data.address);
        }
        });
    }
    else {
        alert("请将个人信息填写完整！");
    }

}


formSubmit=new FormSubmit();
