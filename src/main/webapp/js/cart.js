//查询更多
function checkmore(){
	
	var statu=$("#sta").text();
    console.log(statu);
	var data1={"statu":statu};
	console.log("data1"+data1.statu);
	$.post("/ShoppingWeb/ajax/CartAjax_checkMore", data1, function(data, statusText) {
        var cart=data.cartItemList;
        console.log("cart"+cart[0]);
		var html="";
		var result=data.result;
        var statu=data.statu;
        console.log("result"+result);
        console.log("statu"+statu);
		if(result=="true"){
		if(statu=="0")//全部商品页面
 		{
			for (var i=0;i<cart.length;i++)
			{
			    var sumPrice =cart[i].num*cart[i].commodityByComid.cost;
				html+="<tr id='"+cart[i].id+"tr' >";
				html+="<td>";				
				html+="<span style='display: inline-block;'>" +
				"<input type='checkbox' " +
				" class='select checkbox'"+" style='display: inline-block;width:20px;' " +
				" name='checkboxs' " +
				" id='"+cart[i].id+"'"+
				" onclick='"+"ChangeSum("+cart[i].id+")"+"'"
				+"></span>";
				html+="<span>"+cart[i].commodityByComid.cname+"</span></td>"
				html+="	<td><span><img ";
				html+="	src='../img/"+cart[i].commodityByComid.pic+"' width='80px' height='80px'></span> <span>"+cart[i].commodityByComid.info+"</span> <br>&nbsp&nbsp&nbsp&nbsp <a style='color: red'> ";
				html+="<span class='glyphicon glyphicon-home'>商家:"+cart[i].commodityByComid.merchant+"</span></a></td>";
			
				html+="<td><span>"+cart[i].commodityByComid.classify +"</span></td>";
				
				html+="<td><span>"+cart[i].commodityByComid.cost+"</span></td>";
				
				
				html+="<td>" + "<a onclick='reduce("+cart[i].id+","+cart[i].commodityByComid.cost+")'> <span>-</span> </a>";
				html+="<span> <input id='"+cart[i].id+"num' onblur='changenum("+cart[i].id+")'";
				console.log("<span> <input id='"+cart[i].id+"num' onblur='changenum("+cart[i].id+")'");
				html+="	 type='text' value='"+cart[i].num+"' style='width: 20px;' /> </span>";
				html+="<a onclick='add("+cart[i].id+","+cart[i].cost+")'><span>+</span></a></td>";
				html+="<td>￥<span id='"+cart[i].id+"sp"+"'>"+sumPrice+"</span>"+"</td>";
				
				html+="<td>";			
				html+="<li id='"+cart[i].id+"dl' onclick='deleteitem("+cart[i].id+")' class='btn btn-danger btn-sm'><span class='glyphicon glyphicon-trash'>" +
						"</span> 删除</li></td>"
				html+="	</tr>";	
//				$(document).ready(function(){
//					  $('.select').iCheck({
//						    checkboxClass: 'icheckbox_square-orange',
//			 			    radioClass: 'iradio_square-orange', 
//			 			    increaseArea: '20%' // optional
//							 
//
//						  }); 
//						 
//						});
			}
		}else{//已购买商品页面
			for (var i=0;i<cart.length;i++)
			{
                var sumPrice =cart[i].num*cart[i].commodityByComid.cost;
                console.log("sumPrice"+sumPrice);
				html+="<tr id='"+cart[i].id+"tr' >";
				
				html+="<td>";
				
				html+="<span>" +
						"<input type='checkbox' " +
						"class='select checkbox' " +"style=' display: inline-block;'"+
						"name='checkboxs' " +
						"id='"+cart[i].id+"'"+
						"onclick='"+"ChangeSum('"+cart[i].id+"')"+"'"
						+">"
						" &nbsp&nbsp</span>";
				
				html+="<span>"+cart[i].commodityByComid.cname+"</span></td>"
				
				html+="	<td><span><img ";
				html+="	src='../img/"+cart[i].commodityByComid.pic+"' width='80px' height='80px'></span> <span>"+cart[i].commodityByComid.info+"</span> <br>&nbsp&nbsp&nbsp&nbsp <a style='color: red'> ";
				html+="<span class='glyphicon glyphicon-home'>商家:"+cart[i].commodityByComid.merchant+"</span></a></td>";
			
				html+="<td><span>"+cart[i].commodityByComid.classify +"</span></td>";
				
				html+="<td><span>"+cart[i].commodityByComid.cost+"</span></td>";
								
				html+="<td><span>"+cart[i].num+"</span>"+"</td>"
				html+="<td>￥<span id='"+cart[i].id+"sp"+"'>"+sumPrice+"</span>"+"</td>";
				
				html+="<td>";							
				html+="	</tr>";	
			}
		}
			console.log(html);
			$("#tbody").append(html);
			var f=parseInt(flag)+1;
			$("#flag").html(f)
			console.log("flag"+f)
		}else{
			alert("客官，没有更多的数据了！")
		}
	},"json");

}
//////////////////////////////////////////////////////////////////////////////////////////////////
//
//每次刷新内容设置wrap的位置
$(function() {
	var sta = $("#sta").html();
	if (sta == "0") {
		$("#floater").velocity({
			left : "168px"
		}, 200);
		$("#font1").attr("style", "color:#FF4400");
		$("#font0").attr("style", "color:#3C3C3C");
	}
});
// 改变wrap的位置
function changewarp(id) {
	if (id == '1') {
		$("#floater").velocity({
			left : "168px"
		}, 200);
		$("#font1").attr("style", "color:#FF4400");
		$("#font0").attr("style", "color:#3C3C3C");
	} else {
		$("#floater").velocity({
			left : "-1px"
		}, 200);
		$("#font0").attr("style", "color:#FF4400");
		$("#font1").attr("style", "color:#3C3C3C");
	}
}
// 减少商品
function reduce(id) {
    //获取页面属性
	var numid = id + 'num';
	var num = parseInt($("#"+numid).val());
	num--;
	//修改页面属性sumprice的值
	var pid = id + 'sp'
    var sumprice = $("#"+pid).text();
    var price = $("#"+id+"price").html()
	sumprice -= parseFloat(price);

    //更新页面
	$("#"+numid).val(num);
	$("#"+pid).html(sumprice);
	console.log("进入ajax");
		var cartitem = {
			"cartitem.id" : id,
			"cartitem.num" : num
		}
		console.log("cartitem"+cartitem);
		$.post("/ShoppingWeb/ajax/CartAjax_changeNum", cartitem, function(data, statusText) {
		}, "json");
}
//输出框改变num数量
function changenum(id){
	var num=parseInt($("#"+id+"num").val());
	console.log(id);
	console.log(num);
	console.log(price);
    var price = parseFloat($("#"+id+"price").html());
	var pid = id + 'sp';
	var sumprice =parseFloat(price)*parseInt(num);
	$("#"+pid).text(sumprice);
	var cartitem = {
			"cartitem.id" : id,
			"cartitem.num" : num,
		}
		console.log(cartitem);
	$.post("/ShoppingWeb/ajax/CartAjax_changeNum", cartitem, function(data, statusText) {
	}, "json");
}

// 增加商品数量
function add(id) {
    //获取页面属性
    var numid = id + 'num';
    var num = parseInt($("#"+numid).val());
    num++;
    //修改页面属性sumprice的值
    var pid = id + 'sp'
    var sumprice = parseFloat($("#"+pid).text());
    var price = $("#"+id+"price").html()
    sumprice += parseFloat(price);

    //更新页面
    $("#"+numid).val(num);
    $("#"+pid).html(sumprice);
    console.log("进入ajax");
    var cartitem = {
        "cartitem.id" : id,
        "cartitem.num" : num
    }
    console.log("cartitem"+cartitem);
	$.post("/ShoppingWeb/ajax/CartAjax_changeNum", cartitem, function(data, statusText) {
	}, "json");
}
// 删除一个商品
function deleteitem(id) {
	var cartitem = {
		"cartitem.id" :  parseInt(id)
	}
	$.post("/ShoppingWeb/ajax/CartAjax_delete", cartitem, function(data, statusText) {
		var obj = $.parseJSON(data);
		var result = obj.result;
		console.log(result);
		if (result == "true") {
            var items=parseInt($("#allitems").html());
            $("#allitems").html(items-1);
			$("#" + id + "tr").remove();
		}
	}, "html");
}
// 全选
function selectall() {
	if ($("input.select").is(':checked')) {
		$("#controlcheck").attr("value", "全选");// $("#controlcheck").html("反选")
		$("input.select").iCheck('uncheck');
		$("#sumfont").html(0);
		$("#pfont").html(0);

	} else {
		$("#controlcheck").attr("value", "反选");
		$("input.select").iCheck('check');
		var sum = 0;
		var price;
		var count = 0;
		$("input.select[type='checkbox']:checked").each(function() {
			var arr = $(this)[0].id;
			price = parseInt($("#" + arr + "sp").html());
			console.log("price" + price);
			sum += price;
			count += 1;
		});
		console.log("sum" + sum);
		console.log("count" + count);
		$("#sumfont").html(sum);
		$("#pfont").html(count);
	}
}
// 删除选中的订单详细项
function deleteall() {
	var abid = [];
	var counts=0;
	$("input.select[type='checkbox']:checked").each(function() {
		var arr = $(this)[0].id;
		abid.push(parseInt(arr));
        counts++;
	});
	if (abid.length == 0) {
		alert("没有选项哟");
	} else {
		confirm("确定删除?", "", function(isConfirm) {
			if (isConfirm) {
				console.log("确认");
				// 一部传输bid 数组
				console.log(abid);
				console.log("确认");
				console.log(abid[0]);
				$.post('/ShoppingWeb/ajax/CartAjax_deleteAll', {
					"abid" : abid.join(',')
				}, function(data, statusText) {
					var obj = $.parseJSON(data);
					var result = obj.result;
					console.log(result);
					if (result == "true") {
						console.log("result");
						for (var i = 0; i < abid.length; i++) {
							var id = abid[i] + "tr";
							console.log(id);
							console.log("#" + id);
							$("#" + id).remove();
						}
                        var items=parseInt($("#allitems").text());
                        $("#allitems").text(items-counts);
                        $("#sumfont").html(0);
                        $("#pfont").html(0);
                        $("#controlcheck").attr("value", "全选");
					} else {

						console.log("失败");
					}
				}, "html");

			}

		})
	}
}

// 结算选中的订单详细项
function payall() {
    var solds=0;
	var abid = [];
	$("input.select[type='checkbox']:checked").each(function() {
		var arr = $(this)[0].id;
		abid.push(parseInt(arr));
		++solds;
	});

	
	if (abid.length == 0) {
		alert("没有选项哟");
	} else {
		confirm("确定购买选中的物品?", "", function(isConfirm) {
			if (isConfirm) {
				console.log("确认");
				// 一部传输bid 数组
				// console.log(abid);
				// console.log("确认pppp");
				var count=parseInt(abid.length);				
				var items=parseInt($("#allitems").html());
                console.log("items1"+items)
				items=items-solds;
				// console.log(abid[0]);
				console.log("items2"+items)
				$("#allitems").text(items);
				var sale=parseInt($("#soldfont").html());
                console.log("sale1"+sale)
				sale=sale+solds;
				console.log("sale2"+sale)
				$("#soldfont").text(sale);
				$.post('/ShoppingWeb/ajax/CartAjax_payAll', {
					"abid" : abid.join(',')
				}, function(data, statusText) {
				    var obj = $.parseJSON(data);
					var result = obj.result;
					if (result == "true") {
						console.log("result");
						for (var i = 0; i < abid.length; i++) 
						{
							var id = abid[i] + "tr";
							console.log(id);
							console.log("#" + id);
							$("#" + id).remove();
						}
                        $("#sumfont").html(0);
                        $("#pfont").html(0);
                        $("#allitems").html(items);
                        $("#soldfont").html(sale);
                        $("#controlcheck").attr("value", "全选");
					} else {

						console.log("失败");
					}
				}, "html");

			}

		})
	}
}
// 改变选择商品结算金额
function ChangeSum(id) {
	console.log(id);
	if (document.getElementById(id).checked == true) {
		
		var i = parseInt($("#pfont").html());
		i++;
		var sumprice = parseInt($("#sumfont").html());
		var price = parseInt($("#" + id + "sp").html());
		sumprice += price;
		$("#pfont").html(i);
		$("#sumfont").html(sumprice);

	} else {
		var i = parseInt($("#pfont").html());
		i--;
		var sumprice = parseInt($("#sumfont").html());
		sumprice -= parseInt($("#" + id + "sp").html());
		$("#pfont").html(i);
		$("#sumfont").html(sumprice);
	}
}


//$(function(){
//		$(document).ready(function(){
//		  $('.select').iCheck({							 		  
//			    checkboxClass: 'icheckbox_square-orange',
//			    radioClass: 'iradio_square-orange', 
//			    increaseArea: '20%', // optional						 			     
//	  }); 						 		
//	});
//}
//)