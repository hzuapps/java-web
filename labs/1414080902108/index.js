/**
 * Created by Bingo on 2016/10/1 0001.
 */
var m1 = false;
var m2 = false;
var m3 = false;
var m4 = false;
var m5 = false;


$(document).ready(function () {
    $(".pid").hide();
    $("#row").submit(function (event) {
        if ($("#InputId").val() == "" || $("#InputUserName").val() == "" ||
            $("#InputEmail1").val() == "" || $("#InputPassword1").val() == "" ||
            $("#InputSchool").val() == "") {
            IsEmpty("#InputId");
            IsEmpty("#InputUserName");
            IsEmpty("#InputEmail1");
            IsEmpty("#InputPassword1");
            IsEmpty("#InputSchool");
        }
        else {
            $.ajax({
                url: "success.json"
            }).done(function (data) {
                if (console && console.log) {
                    console.dir(data);
                    alert(data.msg);
                }
            });
        }
        event.preventDefault();
    });

    $("#reset").on("click", function () {
        m1 = false;
        m2 = false;
        m3 = false;
        m4 = false;
        m5 = false;

        $(".pid").hide();
        $("input").parent().removeClass("has-success");
        $("input").parent().removeClass("has-error");
        $("input").next().removeClass("glyphicon-ok");
        $("input").next().removeClass("glyphicon-remove");
    });

    $("body").on("click", function () {
        IsShow("#InputId", m1);
        IsShow("#InputUserName", m2);
        IsShow("#InputEmail1", m3);
        IsShow("#InputPassword1", m4);
        IsShow("#InputSchool", m5);
    });


    $("#InputId").on("click", function () {
        m1 = true;
    })
    $("#InputUserName").on("click", function () {
        m2 = true;
    })
    $("#InputEmail1").on("click", function () {
        m3 = true;
    })
    $("#InputPassword1").on("click", function () {
        m4 = true;
    })
    $("#InputSchool").on("click", function () {
        m5 = true;
    })
});

function IsEmpty(i) {
    $(i).next().addClass("glyphicon");
    $(i).next().addClass("form-control-feedback");
    $(i).parent().addClass("has-feedback");
    if ($(i).val() == "") {
        $(i).parent().removeClass("has-succeed");
        $(i).next().removeClass("glyphicon-ok");
        $(i).parent().addClass("has-error");
        $(i).next().addClass("glyphicon-remove");
        $(i).parent().prev().show();
    }
    else {
        $(i).parent().removeClass("has-error");
        $(i).next().removeClass("glyphicon-remove");
        $(i).parent().addClass("has-success");
        $(i).next().addClass("glyphicon-ok");
        $(i).parent().prev().hide();
    }
}

function IsShow(i, m) {
    if ($(i).is(":focus") == false) {
        if (m == true) {
            IsEmpty(i);
        }
    }
}
