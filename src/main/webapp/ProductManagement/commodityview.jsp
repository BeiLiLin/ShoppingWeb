<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'commodityview.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta char-set="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta name="description" content="图书，正品行货，低至2折，700多城市货到付款。">
<meta name="keywords" content="网上购物，网上商城，网上买书，购物中心，在线购物，图书">

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/nav-footer.css"
	rel="stylesheet" type="text/css">
	
<script type="text/javascript" src="./js/mzp-packed.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/commodity.css"  rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commodity.js"></script>
<title>网上购书中心</title>
</head>

<body>
	<%@ include file="/inc/nav.jsp"%>
	<div id="bo">
		<div>
			<%--<s:iterator value="#session.cdy">--%>
		</div>
		<div id="child">
	
	<div id="childcontent" style="  margin-top: 116px;">
<!-- 		<div id="childpic"><img src="img/13.jpg"/></div> -->
			
		<!--文艺-->
		<%-- <span id="tips">图书>儿童读物>我是花木兰</span> --%>
		<div id="left"><img src="${pageContext.request.contextPath}/img/${commodity.pic}" width="320px" height="320px"/>
			
		  <%-- <span><a>分享</a></span> 
		  <span><a>收藏商品</a></span>  --%>
		</div>
		<div id="content">
			<p><strong>${commodity.cname}</strong></p>
			<span>${commodity.info}</span>
			<div id="prise">
				<span> &nbsp; &nbsp;价格</span><br />
				<span class="prisetext">￥<span id="saleprise"></span> (7折) <span id="oldprise">定价：￥${commodity.cost*0.7}</span> </span>
				<%--<script type="text/javascript">--%>
					<%--$(function(){--%>
						<%--var p=parseInt($("#oldpriseText").text());--%>
						<%--p=p*0.7;--%>
						<%--$("#saleprise").text(p);--%>
						<%--console.log(p)--%>
						<%--$--%>
						<%--})--%>
				<%--</script>--%>
			</div>
			<div id="service">
				<div id="adress" class="serviceText">
					<span>配&nbsp;送&nbsp;至</span>&nbsp;&nbsp;
							<select>
							<option>北京</option>
							<option>珠海

							
							</option>
							<option>广州</option>
							<option>湖北</option>
							<option>天津</option>
							<option>茂名</option>
						</select>&nbsp;&nbsp;
						<span style="color: #000000;">有货&nbsp;免邮</span>
						<span style="color: #000000;">
							<!-- 加减商品个数 -->																													
							数量<input id="numChange"type="text" value="1"style="width: 20px;"/>
						</span>
				</div>
				<div id="sever" class="serviceText">
					<span>服 &nbsp;&nbsp;&nbsp;&nbsp;务</span>&nbsp;&nbsp;
					<span style="font-size:14px ;">由<s:property value="merchant"/>商家发货，并提供售后服务。22:15前完成下单<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预计明天(5月15日)可送达</span>

					
				</div>
<!-- 				<div id="product" class="serviceText"> -->
<%-- 					<span>关联商品</span> --%>
<%-- 					&nbsp;&nbsp;<span class="productText">《我们的太阳》</span> --%>
<%-- 					<span class="productText">《狼国女王》</span> --%>
<%-- 					<span class="productText">《如果恐龙还活着》</span> --%>
<!-- 				 </div> -->
				
				 <div id="btn">
					<div id="cart"> 
						<button id="cartbtn" value="加入购物车" onclick="addCart()">加入购物车</button>
						
					</div>
					<div id="buynow">
						<button id="buy" value="立即购买">立即购买</button>
					</div>					
				</div>
			</div>
			
		</div>			
<%-- 		<div id="right">	
		<div id="logo"><img src="img/11_1.jpg"/></div>
		<span class="shop"><a>进入店铺</a></span>
		<span class="shop"><a>收藏店铺</a></span>
        </div> --%>
	</div>
</div>
		
<%-- 		<div id="pro_content">
		<div class="box"
			style="width: 630px; display: inline-block; margin: 60px auto;">

			<div class="left-pro">

				<div class="t2">

					<img
						src="${pageContext.request.contextPath}/img/<s:property value="pic"/>" />

				</div>
			</div>
		</div>



		<div
			style="display: inline-block; position: absolute; float: right; width: 500px; margin: 90px auto;">
			<div>
				<h2>
					<s:property value="cname" />
				</h2>
				<p>
					<span><s:property value="info" /></span>
				</p>
			</div>
			<p style="color: red; font-size: 25px;">
				<span class="yen">¥</span>
				<s:property value="cost" />
			</p>
		</div>
		</div> --%>
<%-- 		<div class="buy_box"
			style="display: inline-block; position: absolute; float: right; width: 1000px; margin: 300px auto;">

			<div>
				<a onclick="addcart('<s:property value="cid"/>','uid')"
					style="display: inline-block; margin: 0 auto;">加入购物车</a> <a
					style="display: inline-block; margin: 0 auto;">立即购买</a> <a
					style="display: inline-block; margin: 0 auto;">购买电子书</a> <a
					style="display: inline-block; margin: 0 auto;">收藏商品</a>
			</div>
		</div> --%>


		<div id="pro_comment">
			<div
				style="width: 800px; height: 70px; border-bottom: 1px solid red; margin: 0 auto">
				<p style="float: left; font: 20px 'arial rounded mt bold';">商品评价：</p>
			</div>
				<div style=" padding: 0px" id="user_com">
					<textarea id="message" name="message"></textarea>
                    <input type="submit" id="bu" onclick="addComment()">
				</div>
			<div>
				<%--</s:iterator>--%>
			</div>
			<table id="tbc">
				<tbody id="tbody">
					<s:iterator value="commentList">
						<tr class="t">
							<td class="mess">${message}</td>
						</tr>
						<tr class="tu" style="border-bottom: 1px solid #b5a5a5; ">
							<td class="time" style="float: right;    margin-bottom: 5px;">${createDate}</td>
                            <td>用户ID：${uid}</td>
							<td>评分：${evaluate}</td>
						</tr>
						
				</s:iterator>
				</tbody>
			</table>
		</div>


<%-- 		<div style="position: relative; clear: both;">
			<div style="height: 200px;"></div>
			<div style="width: 100%; height: 50px; border-top: 1px solid red;"></div>
			<div id="footer">
				<a href="#">关注我们</a><span>|</span> <a href="#">问题反馈</a><span>|</span>
				<a href="#">广告入驻</a>
			</div>
		</div> --%>
	</div>
</body>
</html>

