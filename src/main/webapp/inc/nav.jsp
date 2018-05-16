<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		id="menu-nav">
		<div class="containter">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#showList">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a id="navbar-brand" href="${pageContext.request.contextPath}/link/Link_index.action" onmouseover="change()" onmouseout="revert()">
                <img id="logo" src="${pageContext.request.contextPath}/img/logo.png" width=" 189px;" height="69px;"
                     style="position: absolute;top: 2px; left: 12px;">
                </a>
				<script type="text/javascript">
						function change()
						{
							$("#logo").width(220).height(90);
							
						}
						function revert()
						{
							$("#logo").width(189).height(69);
							
						}	
				</script>
			</div>
			
			<div class="navbar-collapse collapse navbar-right" id="showList">
				<ul class="nav navbar-nav">
					<li ><span style="color: red"  id="tipspan">${Tip}</span></li>
					<li id="userli" ><a style="height: 50px;"><span class="glyphicon glyphicon-user cguname" id="showName">${username}</span></a></li>
					<s:if test="#session.username==null">
					<li class=""><a class="login"><span
                        class="glyphicon glyphicon-qrcode"></span> &nbsp;&nbsp;登录</a></li></s:if>
					<s:else>
					<li class="" ><s:url action="User_put" namespace="/user" id="out"></s:url>
					<s:a href="%{out}">退出登录</s:a></li>
					</s:else>	
					<!-- 				struts超链接标签			 -->
					<s:if test="#session.username!=null">
					<li><s:url action="User_userInfo" namespace="/user" id="userInfo"></s:url>
					<s:a href="%{userInfo}" id="info">修改个人信息</s:a></li>
					</s:if>
					<li class=""><s:url action="Cart_showCart" namespace="/product"
							id="carturl"></s:url> <s:a href="%{carturl}">
							<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;购物车</s:a>
					</li>
					<li><a>收藏夹</a></li>
					<li><a data-toggle="modal">卖家中心</a></li>
					<li><a data-toggle="modal" data-target="#about">关于我们</a></li>

				</ul>

			</div>

		</div>
	</div>