function checkuserid()
{
	console.log("regist");
    var uid=$("#uid").val();
    if(uid.length>0){
        var user={"user.uid":uid};
        console.log(user);
        $.post("/ShoppingWeb/ajax/Ajax_checkUid",user,function(data,statusText){
            var result=data.result;
            console.log( result);
            if(result=="true")
            {
                $("#uidspan").html("<font style='color:red'>"+"*账号已经存在！"+"</font>");
            }else{
                $("#uidspan").html("<font style='color:green'>"+"*账号可以使用！"+"</font>");
            }

        },"json");
    }else{
        $("#uidspan").html("<font style='color:red'>"+"*账号不能为空！"+"</font>");
    }

}
//检验用户名
function checkUname()
{
    console.log("checkPass");
    var name = $("#uname").val();
    console.log(name);
    if(name.length <= 0){
        $("#nameSpan").html("<font style='color:red'>"+"*用户名不能为空！"+"</font>")
    }else{
        $("#nameSpan").html("<font style='color:green'>"+"*用户名可用！"+"</font>")
    }
}
//检验密码
function checkPass()
{
    console.log("checkPass");
    var pass = $("#pass").val();
    console.log(pass);
    if(pass.length <= 0){
        $("#passSpan").html("<font style='color:red'>"+"*密码不能为空！"+"</font>")
    }else{
        $("#passSpan").html("<font style='color:green'>"+"*密码可用！"+"</font>")
        if($("#confirmPass").val().length>0){
            ConfirmPass();
        }

    }
}
//确认密码
function ConfirmPass()
{
    console.log("sdsda");
    var pass = $("#pass").val();
    var confirm = $("#confirmPass").val();
    console.log(pass+":"+confirm);
    if (pass.length>0 && pass == confirm){
        $("#ConfirmPassSpan").html("<font style='color:green'>"+"*密码一致！"+"</font>")
    }else if (pass.length>0 ||confirm.length>0){
        $("#ConfirmPassSpan").html("<font style='color:red'>"+"*密码不一致！"+"</font>")
    }
}
//确认密码
function CheckTele()
{

    var tele = $("#tele").val();
    console.log(tele);
    if (tele.length != 11){
        $("#TeleSpan").html("<font style='color:red'>"+"*请输入11位的电话号码！"+"</font>")
    }else{
        $("#TeleSpan").html("<font style='color:green'>"+"*电话可用！"+"</font>")
    }
}

