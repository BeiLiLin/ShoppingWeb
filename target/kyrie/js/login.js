function checklogin() {
	var uid = $("#email").val();
	var pass = $("#password").val();
    var user={"user.uid":uid,
        "user.password":pass};
	$.post("http://localhost:8080/ShoppingWeb/ajax/Ajax_login", user,
					function(data, statusText) {
						// var datajson=JSON.stringify(data);//将json对象转换为json字符串
						// var obj=$.parseJSON(datajson);//将json字符串转换为对象
						// console.log("data"+JSON.stringify(data));
						var result=data.result;//取出对象中的result属性
                        // console.log(result);
						var user=data.user;
                        // console.log(user);
						var name=user.uname;
                        // console.log(name);
						var rank=user.rank;//取出对象中的name属性
                        // console.log(rank);
						if(result=="false")
							{
								html="";
								html+="<font color='red'>"+"*登录信息错误，请检查信息"+"</font>"
								$("#show").html(html);
							}else{
								if(rank>=1)
									{
										location="http://localhost:8888/ShoppingWeb/UserManagement/userManager.jsp";
									}else{
                                    // var s = $("#showName").html();
                                    // console.log(s);
                                    // console.log(name);
                                    $("#showName").html(name);
								confirm("登录成功！", "", function (isConfirm) {
						            if (isConfirm) {	
						            	// console.log("result");
						            	$(".cguname").text(name);
						            	$("#tipspan").empty();
						            	$('#login').modal('hide');
						            	$("#loginli").hide();
						            	if($("#info").length<=0)
						            		{						            			
						            			var html="<li><a href='/ShoppingWeb/user/User_put.action'>退出登录</a></li>";
							            		html+="<li><a href='/ShoppingWeb/user/User_userInfo.action'>修改个人信息</a></li>";
								            	// console.log(html);
                                                //在userli后插入html
								            	$("#userli").after(html);
								            	
						            		}
						            	
						            }					            
						            })
								}//if rank>=1
							}
							}, "json");
}

//加载时判断注册结果
$(function () {
    // console.log("ssdasd");
	var result = $("#LoginResult").html();
	// console.log("result:"+result);
	if (result != null && result =="true"){
	    alert("注册成功！");
    }else if(result != null && result =="false"){
        alert("注册失败！");
    }
});
