
	var flag;//0编辑，1添加
	//选择按钮
		var totalpages;//总页数
		var curpage=1;//当前页
		var searchCon = "";	//搜索内容
		
		function getSearchText(){
			var keyword = $("#search").val();
			if(keyword==""){
				return;
			}
		//	console.log(keyword);
			$.ajax({
				type:'post',
				url:'/ShoppingWeb/user/User_search.action',
				data:{"keyword":keyword},

				success:function( data ){
					var data1 = JSON.stringify(data);
					//console.log(data);
					setSearchContent(data1 );
				}
				
			})
		}
		// 去除重复项

		 Array.prototype.only = function(){  
		            var h= {};    //定义一个hash表  
		            var arr=[];  //定义一个临时数组  
		              
		            for(var i = 0; i < this.length; i++){    //循环遍历当前数组  
		                //对元素进行判断，看是否已经存在表中，如果存在则跳过，否则存入临时数组  
		                if(!h[this[i]]){  
		                    //存入hash表  
		                    h[this[i]] = true;  
		                    //把当前数组元素存入到临时数组中  
		                    arr.push(this[i]);  
		                }  
		            }  
		            return arr;  
		        }  
		function setSearchContent( data ){
			$("#searchMenu").empty();
			var datas = JSON.parse(data);
		//	console.log(datas);
			var li = "";
//			console.log(datas.only());
			var arr =datas.ulist.only();
//			console.log( );
		 //	var datas=eval("("+data+")");
			
			var row = datas.length;
			var li = "";
//			console.log("行数",row);
			// 动态增加li
			for(var i=0;i<arr.length;i++){
				li += "<li>"+arr[i]+ "</li>"
				
			} 
			// 
			
			
		/* 	$.each(datas,function(id,val){
				li += "<li>"+val+ "</li>"
			}) */
			$("#searchMenu").append(li);
			list();
		}
		// 点击li 把值输入搜索框
		// console.log($("#searchMenu li"));
		function list(){
			$("#searchMenu li").each(function(index){
				// console.log($("#searchMenu li"));
				  $(this).click(function(){
					   var keyLi = $(this).text();
					   
					//   console.log(keyLi);
					   $("#search").val(keyLi);
				  })
			})
		}
		list();			
	$(document).ready(function(){
		  $('.radio input').iCheck({
		  //  checkboxClass: 'icheckbox_square-blue',
		    radioClass: 'iradio_square-blue',
		    increaseArea: '20%' // optional
		  });
		  
		});
	/* 数据加载 */
	function loadData(){
		//var page={'page.curpage':1};
		$.ajax({
			url:"/ShoppingWeb/user/User_userlist",
			type:'post',
			dataType:'json',
			data:{
				'Curpage':curpage,
				'SearchCon':searchCon
				},
			beforeSend:function(){
				//alert("发送数据");
				
			},
			success:function(data){
				var data1 = JSON.stringify(data);
				
			
				//console.log(data);
				//数据加载完成，处理
				setContent( data1 );				
			}
		})
	}
	loadData();
	/* 动态建表 */
	function setContent( data ){
	// eval (  "(" +data +")"  ) 解析后台数据变成对象；	
		var obj=$.parseJSON(data);

//	console.log(obj);
	totalpages = obj.pagecount;
	
	//console.log(totalpages);
	//console.log(datas);
	// 动态建立表格
//	var row=datas.length;
		var tr = "";
		var role="";
     	 // ( id+1 )  自动转换为 Int
	    $("#showTable").empty();
     	$.each(obj.ulist,function(id,val){
     		if(val.rank==0){
     			role = "普通用户";
     		}else if(val.rank==1){
     			role = "商家";
     		}else{
     			role = "管理员";
     		}
     		// onclick = "+"etid("+"'"+val.bid+"'"+") 参数是字符串时一定要加上  单引号
     		// class 转换 class="del"
     		 tr  +="<tr class="+'text-right'+">"+
     		 "<td class="+'select'+"> "+ parseInt(( id+1 )+(curpage-1)*8) + "<input type="+'checkbox'+" value="+val.uid+" class="+'text-right'+" /></td>"  +
     		 "<td>" +val.uid + "</td>" + 
     		 "<td>" + val.uname + "</td>" +
     		 "<td>" + role + "</td>"+
     		 "<td>" + val.tele + "</td>"+
     		 "<td>" + val.address + "</td>"+    		
     		 "<td class="+'operation'+">" +"<span>"+"<a  id="+'Etid'+id+" onclick = "+"etid("+"'"+val.uid+"'"+") >"+'编辑'+"</a>"+ "</span>"+"</td>"+
     		 "</tr>"   
    	}) 
				
//	}
	//document.getElementById("showTable").append(tr);
		$("#showTable").append(tr);
	    $('.select input').iCheck({
		    checkboxClass: 'icheckbox_square-blue',
		//    radioClass: 'iradio_square-blue',
		    increaseArea: '5%' // optional
		  });		
}	
/* 修改 */
function etid(uid){
	$("#passwordText").css({'display':'none'});
	console.log(uid);  
	flag=0;
//	console.log("123456");
    $("#Etid_header").text("修改用户信息"); 
    // 手动设置弹窗
    $("#add-data").modal("toggle");
    $("#uId").attr("value",uid);
  	$("#uId").val(uid);
    $("#uId").attr("disabled","flase");         		
}

function add(){ 
	flag=1;
	$("#passwordText").css({'display':'block'});
	$("#uId").val("");
	$("#uId").removeAttr("disabled");
    $("#Etid_header").text("添加用户"); 
    // 手动设置弹窗
    $("#add-data").modal("toggle");
   
  //	$("#Etid").attr("value",bid);
  
	
}
/* 保存或修改 */
function save(){
	var uId = $('#uId').val();
	var uName= $('#uName').val();
	var address = $('#address').val();
	var tele = $('#tele').val();
	var password = $("#password").val();
	
	//获取单选按钮的值  先在 radio 里加上 value 属性
	
	var Rank  = $('input[name="iCheck"]:checked').val(); 
	console.log(Rank);
	var user = {	
					'user.Uid':uId,
 					'user.Uname':uName,
 					'user.Address':address,
  					'user.Tele':tele,
 					'user.Rank':Rank,
 					'user.PassWord':password,
 					'flag':flag
				};
	console.log(flag);
	console.log(uId+uName+address+tele+Rank+password);
	
	$.ajax({
		url:"/ShoppingWeb/user/User_edit.action",		
		data:user,
		type:'post',
		dataType:'json',
		success:function(data){	
			var data1 = JSON.stringify(data);
			var obj=$.parseJSON(data1);
			var result=obj.result;
			//	console.log(data);
					// 添加一本书
					alert(result,"",function(){
					loadData();						
					},{type:'success',confirmButtonText:'OK'});		
		}
	});
}
// 单选删除，多选删除
// 设置全选与单选
$("#selectAll").click(function(){
	//判断checkbox是否被选择 如果被选择反选  $(".select input").is(':checked') 记得加冒号
	if($(".select input").is(':checked')){
		$("#selectAll").text("全选");
		$(".select input").iCheck('uncheck');
	}else{
		$(".select input").iCheck('check');
		$("#selectAll").text("反选");
	}	
	
})
$("#deleteBtn").click(function(){
	
	var deleteList = [];
    $(".select input[type='checkbox']:checked").each(function () {
        var arr = $(this).val();
        
    //    console.log(arr);
        deleteList.push(arr);
        console.log(deleteList);
    });	
	if( deleteList.length==0){
		alert("没有选项哟");
	}
	else{

		        confirm("确定删除?", "", function (isConfirm) {
		            if (isConfirm) {
		            	console.log("确认");
		            	// 一部传输bid 数组
		            	$.ajax({
		            		url:'/ShoppingWeb/user/User_delete.action',
		            		type:'post',
		            		dataType:'json',
		            		data:{"DeleteList" :deleteList.join(',') },
		            		beforeSend:function(){
		            			//console.log(data);
		            		},
		            		success:function( data ){
		            			var data1 =JSON.stringify(data);
		            			var obj=$.parseJSON(data1);
		            			var result=obj.result;
		            			console.log("result"+result);
		            		//	console.log(data);
		    					alert(result,"",function(){
		    						loadData();						
		    						},{type:'success',confirmButtonText:'OK'});				            			
		            		}
		            		
		            	})
		            	
		            }
		            
		            })
		 	}
	
});
//  分页
//总页数

function page(){
	$("#panel-footer ul>li").eq(2).find("a").css('background-color','#eee');
	 $("#panel-footer ul>li").eq(2).find("a").addClass("active");
	 $("#panel-footer ul>li").eq(1).find("a").attr("value","1");
	 $("#panel-footer ul>li").eq(7).find("a").attr("value","1");
	// console.log( $("#panel-footer ul>li").eq(1).find("a").attr("value") );
	
	 
	 // 遍历li 节点设置text() 的值  添加active 类，标记当前节点
	$("#panel-footer ul>li").each(function(index){

		  $(this).click(function(){
			  $("#selectAll").text("全选");
			//console.log("总页数");
		  var pre = parseInt($("#panel-footer ul>li a.active").text());
		//  alert(index);
		  console.log(pre);
		  var mid =$("#panel-footer ul>li").eq(4).text();
		  var pageIndex = parseInt($(this).text());
		//  alert(mid); 上一页
			if( index==1  ){
				pageIndex = parseInt(pre) -1;
				console.log(" 上一页",pageIndex);
			}	
			// 下一页
			if( index==7  ){
				pageIndex = parseInt(pre) +1;
				console.log(" 下一页",pageIndex);
			}		
			// 首页
			if( index==0){
				pageIndex = 1;
				
			}
			// 尾页
 			if ( index==8 ){
				pageIndex = totalpages;
			} 
			
		  if(pageIndex !=mid && pageIndex >3){
			  $("#panel-footer ul>li").find("a").css('background-color','');
			  $("#panel-footer ul>li").find("a").removeClass("active");
			  $("#panel-footer ul>li").eq(4).find("a").css('background-color','#eee');
			  $("#panel-footer ul>li").eq(4).find("a").addClass("active");
			//  console.log(mid,index);
			  $("#panel-footer ul>li").eq(2).find("a").text( pageIndex-2 );
			  $("#panel-footer ul>li").eq(3).find("a").text(pageIndex-1);
			  $("#panel-footer ul>li").eq(4).find("a").text(pageIndex);
			  $("#panel-footer ul>li").eq(5).find("a").text( pageIndex+1 );
			  $("#panel-footer ul>li").eq(6).find("a").text(pageIndex+2);
			
			 
		
			// 上一页
			  $("#panel-footer ul>li").eq(1).find("a").attr("value",pre);
				// 下一页
			  $("#panel-footer ul>li").eq(7).find("a").attr("value",pre);
			//  console.log( $("#panel-footer ul>li").eq(1).find("a").attr("value") );
		  }
		  else if(pageIndex== 1 ||  pageIndex==2 || pageIndex == 3){
			//  console.log(pageIndex);
			 // $("#panel-footer ul>li").css('background-color','none');
			  
			  $("#panel-footer ul>li").eq(1).find("a").attr("value",pre);
			  $("#panel-footer ul>li").eq(7).find("a").attr("value",pre);
			  console.log( parseInt($("#panel-footer ul>li").eq(1).find("a").attr("value")));
			  $("#panel-footer ul>li").find("a").css('background-color','');
			  $("#panel-footer ul>li").find("a").removeClass("active");
			  $("#panel-footer ul>li").eq(pageIndex+1).find("a").css('background-color','#eee');
			  $("#panel-footer ul>li").eq(pageIndex+1).find("a").addClass("active");
			  $("#panel-footer ul>li").eq(2).find("a").text( 1 );
			  $("#panel-footer ul>li").eq(3).find("a").text(2);
			  $("#panel-footer ul>li").eq(4).find("a").text(3);
			  $("#panel-footer ul>li").eq(5).find("a").text( 4);
			  $("#panel-footer ul>li").eq(6).find("a").text(5);
			  
		  }		
		  
		  	// 上一页
			//alert($("#panel-footer ul>li a.active").text());
		  	curpage = parseInt($("#panel-footer ul>li a.active").text());
		  	loadData();
		  	
		  });
   });
	
	
}
page();
//条件匹配
$("#searchBtn").click(function(){
	searchCon = $("#search").val();
	curpage = 1;

	  $("#panel-footer ul>li").find("a").css('background-color','');
	

	  loadData();	
	  $("#panel-footer ul>li").find("a").removeClass("active");
	   
		//console.log(searchCon );
	  $("#panel-footer ul>li").eq(2).find("a").addClass("active");
	  $("#panel-footer ul>li").eq(2).find("a").text( 1 );
	  $("#panel-footer ul>li").eq(3).find("a").text(2);
	  $("#panel-footer ul>li").eq(2).find("a").css('background-color','#eee');
	  $("#panel-footer ul>li").eq(4).find("a").text(3);
	  $("#panel-footer ul>li").eq(5).find("a").text( 4);
	  $("#panel-footer ul>li").eq(6).find("a").text(5);
})
	