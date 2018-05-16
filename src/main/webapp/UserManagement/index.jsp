<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/nav-footer.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/BeAlert.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/function.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ConfirmAlert.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>

</head>
<body>
<p id="LoginResult" hidden="true">${requestScope.loginResult}</p>
 <%@include  file="/inc/nav.jsp"%>
	<!-- 登录弹窗 start-->
	<div class="modal fade" id="login">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<!-- 登录框 -->
					<div id="login-form">
						<div id="login-content">
							<div id="login-logo">
								<a id="weChat"><i></i></a> <a id="qq"><i></i></a> <a id="github"><i></i></a>
							</div>
							<div class="division">
								<div class="line l"></div>
								<span> </span>
								<div class="line r"></div>
							</div>

							<div class="form-loginBox">
								<form id="loginform" theme="simple">
									<div id="show" style="text-align: center;"></div>
									<input id="email" Class="form-control" type="text"
										placeholder="Email" name="Uid" />
                                    <input id="password"
										Class="form-control" type="password" placeholder="Password"
										name="password" /> <input type="button" id="loginBtn"
										onclick="checklogin()"
										;
										cssClass="btn btn-default btn-login"
										value="Login" />

								</form>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<div class="forgot login-footer">
						<span>Looking to 
						<s:url action="Link_regist" namespace="/link" id="regist"></s:url>
						<s:a href="%{regist}">create an account</s:a> ?
						</span>
						
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 登录弹窗 end-->
	<!-- 搜索框  -->
	
		<div id="search">
			<div id="search-body">
			
			  <div class="input-group  text-right "  style="dispaly:inline-block;">  
								
				     <input type="text" class="form-control "   placeholder="请输入关键字"  id ="search-content"  > 			   			 
				            <span class="input-group-btn">  
				               <div class="btn btn-info btn-search" id ="searchBtn" >搜索</div>  
				                
				            </span>  
				 </div>  
			</div>
		</div>	
	
	<!--主体内容  -->
	<div id = "content-box">
	<div class="content">
		<div class="left-list" id="content-left">
			<ul>
				<li data-id="a"><span >家用电器</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="b"><span>智能家居</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="c"><span>生活用品</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="d"><span>儿童玩具</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="e"><span>进口零食</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="f"><span>绘画乐器</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="g"><span>学习书籍</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="h"><span>户外运动</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
				<li data-id="h"><span>鲜花宠物</span><span  class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
			<!-- 二级菜单 -->
			<div id="menu" class="none">
				<div id="a" class="menu-list  none">
					<dl>
						<!-- 电视 -->
						<dt>
							<a href="#">电视<i>&gt;</i></a>
						</dt>
						<dd>
							<a href="#">合资品牌</a> <a href="#">国产品牌</a> <a href="#">互联网品牌</a>
						</dd>
					</dl>
					<!-- 电冰箱 -->
					<dl>
						<dt>
							<a href="#">电冰箱<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">进口品牌</a> <a href="#">合资品牌</a> <a href="#">国产品牌</a> <a
								href="#">互联网品牌</a> <a href="#">私营品牌</a>
						</dd>
					</dl>

					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">国产品牌</a> <a
								href="#">一棵松鼠</a> <a href="#">便利店</a>
						</dd>
					</dl>
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">便利店</a> <a
								href="#">一棵松鼠</a> <a href="#">国产品牌</a>
						</dd>
					</dl>
				</div>

				<div id="b" class="menu-list none">
					<dl>
						<!-- 电视 -->
						<dt>
							<a href="#">电视<i>&gt;</i></a>
						</dt>
						<dd>
							<a href="#">合资品牌</a> <a href="#">国产品牌</a> <a href="#">互联网品牌</a>
						</dd>
					</dl>


					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">国产品牌</a> <a
								href="#">一棵松鼠</a> <a href="#">便利店</a>
						</dd>
					</dl>
					<!-- 电冰箱 -->
					<dl>
						<dt>
							<a href="#">电冰箱<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">进口品牌</a> <a href="#">合资品牌</a> <a href="#">国产品牌</a> <a
								href="#">互联网品牌</a> <a href="#">私营品牌</a>
						</dd>
					</dl>
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">便利店</a> <a
								href="#">一棵松鼠</a> <a href="#">国产品牌</a>
						</dd>
					</dl>
				</div>

				<div id="c" class="menu-list none">
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">便利店</a> <a
								href="#">一棵松鼠</a> <a href="#">国产品牌</a>
						</dd>
					</dl>
					<!--电视  -->
					<dl>
						<dt>
							<a href="#">电视<i>&gt;</i></a>
						</dt>
						<dd>
							<a href="#">合资品牌</a> <a href="#">国产品牌</a> <a href="#">互联网品牌</a>
						</dd>
					</dl>


					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">国产品牌</a> <a
								href="#">一棵松鼠</a> <a href="#">便利店</a>
						</dd>
					</dl>
					<!-- 电冰箱 -->
					<dl>
						<dt>
							<a href="#">电冰箱<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">进口品牌</a> <a href="#">合资品牌</a> <a href="#">国产品牌</a> <a
								href="#">互联网品牌</a> <a href="#">私营品牌</a>
						</dd>
					</dl>

				</div>

				<div id="d" class="menu-list none">
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">便利店</a> <a
								href="#">一棵松鼠</a> <a href="#">国产品牌</a>
						</dd>
					</dl>
					<!--电视  -->
					<dl>
						<dt>
							<a href="#">电视<i>&gt;</i></a>
						</dt>
						<dd>
							<a href="#">合资品牌</a> <a href="#">国产品牌</a> <a href="#">互联网品牌</a>
						</dd>
					</dl>


					<!-- 电冰箱 -->
					<dl>
						<dt>
							<a href="#">电冰箱<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">进口品牌</a> <a href="#">合资品牌</a> <a href="#">国产品牌</a> <a
								href="#">互联网品牌</a> <a href="#">私营品牌</a>
						</dd>
					</dl>
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">国产品牌</a> <a
								href="#">一棵松鼠</a> <a href="#">便利店</a>
						</dd>
					</dl>
				</div>

				<div id="e" class="menu-list none">
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">便利店</a> <a
								href="#">一棵松鼠</a> <a href="#">国产品牌</a>
						</dd>
					</dl>
					<!-- 零食 -->
					<dl>
						<dt>
							<a href="#">零食<i>&gt;</i></a>
						</dt>
						<dd>

							<a href="#">日本零食</a> <a href="#">韩国进口</a> <a href="#">国产品牌</a> <a
								href="#">一棵松鼠</a> <a href="#">便利店</a>
						</dd>
					</dl>
				</div>




			</div>
			<!-- end 二级菜单 -->
		</div>
		<!-- end 一级菜单 -->
		<!-- 轮播图 -->
		<div class="right">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"  >
	<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>   
				
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						
						<div class="item active">
						<img src="${pageContext.request.contextPath}/img/pp1.jpg " width="1065" height="395"  alt="First slide">
						</div>
						<div class="item">
						<img src="${pageContext.request.contextPath}/img/c12.jpg "  width="1065" height="395" alt="Second slide">
						</div>
						<div class="item">
						<img src="${pageContext.request.contextPath}/img/110.jpg "  alt="Third four">
						</div>
					</div>
	

	</div><!--  end myCarousel  -->
	
</div>
	</div>
	</div>
	<!-- 商品展示区 -->
	<div id="shop " >
			<div id="shop-content" class="container">
				<div class="row">
					<div class="shop-header"><span class="shop-line">|</span>猜你喜欢</div>
					<div class="col-sm-6 col-md-3 col-lg-3">
						<s:url action="Com_showCommoidity" namespace="/product" var="a">
							<s:param name="commodity.id" value="3"/>
						</s:url>
						<s:a href="%{a}">
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/cc9.png" width="289" height="320" ></div>
							<div class="img-content btn">魅族note6&nbsp;64G</div>
						</div>
						</s:a>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
							<s:url action="Com_showCommoidity" namespace="/product" id="a">
							<s:param name="commodity.id" value="4"/>
						</s:url>
						<s:a href="%{a}">
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c10.png" width="290" height="320"></div>
							<div class="img-content btn">魅族&nbsp;Note6</div>
						</div>
						</s:a>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
						<s:url action="Com_showCommoidity" namespace="/product" id="a">
							<s:param name="commodity.id" value="5"/>
						</s:url>
						<s:a href="%{a}">
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c11.png " width="290" height="320"></div>
							<div class="img-content btn">GOME&nbsp;S1</div>
						</div>
						</s:a>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
						
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c12.png " width="290" height="320"></div>
							<div class="img-content btn">SONY&nbsp;M3</div>
						</div>
					</div>		
								
				</div>
<!--  二列-->
				<div class="row">
					<div class="shop-header"><span class="shop-line">|</span>猜你喜欢</div>
					<div class="col-sm-6 col-md-3 col-lg-3">
						<s:url action="Com_showCommoidity" namespace="/product" id="a">
							<s:param value="2" name="commodity.id"/>
						</s:url>
						<s:a href="%{a}">
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c13.png " width="290" height="320"></div>
							<div class="img-content btn">金士顿&nbsp;UBS3.0</div>
						</div>
						</s:a>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
					
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c14.png "  width="290" height="320"></div>
							<div class="img-content btn">外星人&nbsp;ET760</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
						
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c15.png"  width="290" height="320"></div>
							<div class="img-content btn">SONY&nbsp;MTH1002</div>
						</div>
					</div>

					<div class="col-sm-6 col-md-3 col-lg-3">
						
						<div class="shop-product animate-shadow-2">
							<div class="product-img"><img src="${pageContext.request.contextPath}/img/c16.png " width="290" height="320"></div>
							<div class="img-content btn">进口&nbsp;食品</div>
						</div>
					</div>		
								
				</div>	
		</div>
			
	</div>
	
	<!--  页脚-->
	<div id = "footer">
			<div id = "footer-content">
					<ul>
							<li><span class="name"><img src="${pageContext.request.contextPath}/img/W.png " width="32px" height="32px;"></span><span>redandelion</span></li>
							<li><span class="name"><img src="${pageContext.request.contextPath}/img/H.png " width="32px" height="32px;"></span><span>黄益洪</span></li>
							<li><span class="name"><img src="${pageContext.request.contextPath}/img/L.png " width="32px" height="32px;"></span><span>林泽洪</span></li>
							<li><span class="name"><img src="${pageContext.request.contextPath}/img/F.png " width="32px" height="32px;"></span><span>方雨石</span></li>
					</ul>
			</div>
	
	</div>
	<script type="text/javascript">
	
	$(function(){
		$("#myCarousel").carousel('cycle');
		
	})
$(function(){
    $(".login").click(function(){
      $("#login").modal("toggle");
    });
  });
$(document).ready(function(){
			var sub = $("#menu");
			var activeRow;
			var activeMenu;
			var timer;
			var mouseInSub = false;
			sub.on('mouseenter',function(e){
				mouseInSub = true;
				
			}).on('mouseleave',function(e){
				mouseInSub = false;
			})
			var mouseTrack = [];
			var moveHanlder = function(e){
				mouseTrack.push({
					x: e.pageX,
					y: e.pageY
				})
				if(mouseTrack.length>3){
					mouseTrack.shift();
				}
			}
			/* 为一级菜单添加事件 */
			
			 $("#content-left")
			.on( 'mouseenter',function(e){
				sub.removeClass('none');		
				$(document).bind('mousemove',moveHanlder);
			} )
			.on('mouseleave',function(e){
				sub.addClass('none');
				if(activeRow){
					activeRow.removeClass('active');
					activeRow=null;
				}
				if(activeMenu){
					activeMenu.addClass('none');
					activeMenu = null;
				}
				$(document).unbind('mousemove',moveHanlder);
			})
			.on('mouseenter','li',function(e){
				if(!activeRow){
					activeRow = $(e.target).addClass('active')
					activeMenu = $('#'+activeRow.data('id'))
					activeMenu.removeClass('none')
					return
				}
				if(timer){
					clearTimeout(timer);
				}
				/* 检测是否在移动三角形内部 */
				var currMousePos = mouseTrack[mouseTrack.length-1];
				var leftCorner = mouseTrack[mouseTrack.length-2];
				var delay = needDelay(sub,leftCorner,currMousePos);
				if(delay){
					timer = setTimeout(function(){
						if(mouseInSub){
							
							return							
						}
						
						activeRow.removeClass('active')
						activeMenu.addClass('none')
						
						activeRow = $(e.target)
						activeRow.addClass('active')
						activeMenu = $("#"+activeRow.data('id'))
						
						activeMenu.removeClass('none')			
						timer = null
						
					},300)						
					
				}else{
		           	var prevActiveRow = activeRow;
		           	var prevActiveMenu = activeMenu;					
		           	activeRow = $(e.target)
		           	activeMenu = $('#'+ activeRow.data('id'))					
		           	prevActiveRow.removeClass('active')
		           	prevActiveMenu.addClass('none')
		
		           	activeRow.addClass('active')
		           	activeMenu.removeClass('none')		           	
				}



			})
			
})
</script>

</body>
</html>