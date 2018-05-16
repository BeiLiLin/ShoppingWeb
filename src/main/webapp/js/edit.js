//实现表单字符串srialize()转化为json
$.ajaxSetup({  
    contentType: "application/x-www-form-urlencoded; charset=utf-8"  
});  
var DataDeal = {  
// 将从form中通过$('#form').serialize()获取的值转成json
           formToJson: function (data) {  
               data=data.replace(/&/g,"\",\"");  
               data=data.replace(/=/g,"\":\"");  
               data="{\""+data+"\"}";  
               return data;  
            },  
};  

// 改变li的颜色
$(function change()
{
	console.log("ss"+$(".menu li"));
	$(".menu li").each(function(e){
		$(this).click(function(){						
			$(".menu a").removeClass();			
			$(this).find("a").addClass("active");				
		});			
	})
});
function hidemodal(){	
	$('#myModal').modal('hide');
	
}

function changeInfo(){
	var data1=$("#forminfo").serialize();
	data= decodeURIComponent(data1,true);// 防止中文乱码
	var userjson=DataDeal.formToJson(data);// 转化为json
	var user=JSON.parse(userjson);
	console.log(user);
	if($("#uname").val().length<=0)
		{
			alert("请输入昵称！");
			return false;
		}
	else if($("#pass").val().length<=0)
		{
			alert("请输入密码！");
			return false;
		}
	else if($("#tele").val().length<=0)
	{
		alert("请输入电话！");
		return false;
	}
	else if($("#address").val().length<=0)
	{
		alert("请输入地址！");
		return false;
	}else{
	$.post("/ShoppingWeb/ajax/Ajax_changeInfo",user,function(data,statusText){
				var result=data.result;
				var user = data.user;
				console.log(result);
				if(result=="noUpdate")
				{
					alert("您没有修改任何数据！");
				}else{
                    console.log("result!=noUpdate");
					if(result=="true")
					{
					alert("修改成功！");
                    $("#myModal").modal('hide');
					//修改列表显示信息
                        if(user.uname!=null)
                        {
                             $(".cguname").each(function() {
                                  var n= $(this);
                                  n.text(user.uname);
                                });
                        }
                        if(user.passsword!=null)
                        {
                        $("#passdiv").html(user.password);
                        console.log(user.password);
                        }
                        if(user.tele!=null)
                        {
                        $("#telediv").html(user.tele);
                        console.log(user.tele);
                        }
                        if(user.address!=null)
                        {
                        $("#addressdiv").html(user.address);
                        console.log(user.address);
                        }//修改结束
					}else{
						alert("修改失败！");
					}
				}
				
	},"json");
		}
}