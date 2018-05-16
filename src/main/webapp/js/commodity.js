function addCart() {
    var num=$("#numChange").val();
    console.log("num"+num);
    var data1 = {"num":num};
    console.log("data1"+data1);
    $.post('/ShoppingWeb/ajax/ComAjax_addCart',data1,function(data,statusText) {
        console.log("dsadasddsa");
        var result = data.result;
        if(result == "true"){
            alert("成功加入购物车！");
        }else{
            alert("加入购物车失败！");
        }
    });
}
function addComment() {
    var message=$("#message").val();
    console.log("message"+message);
    $.post('/ShoppingWeb/ajax/CommentAjax_addComment', {
        "message":message
    }, function(data,statusText) {
        var result = data.result;
        console.log(result);
        var comment = data.comment;
        console.log(comment);
        if(result == "true"){
            var time =formatDateTime(comment.createDate);
            var html="<tr class='t'>"+"<td class='mess'>"+comment.message+"</td>"
            +"</tr>"
            +"<tr class='tu' style='border-bottom: 1px solid #b5a5a5;'>"
            +"<td class='time' style='float: right;margin-bottom: 5px;'>"+time+"</td>"
            +"<td>用户ID:"+comment.uid+"</td>"
            +"<td>评分："+comment.evaluate+"</td>"+"</tr>";
            console.log(html);
            $("#tbody").append(html);
            alert("留言成功！");
        }else{
            alert("留言失败！");
        }
    });
}

//时间格式的转换函数方法
function formatDateTime(inputTime) {
    var date = new Date(inputTime);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second+".0";
};