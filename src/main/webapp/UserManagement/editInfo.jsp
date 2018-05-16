<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改界面 ${sessionScope.id}|${sessionScope.uid}|${sessionScope.username}</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/BeAlert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/edit.css">
<link href="${pageContext.request.contextPath}/css/nav-footer.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/edit.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/BeAlert.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/velocity.min.js"></script>

</head>
<body>
	<%@ include file="/inc/nav.jsp"%>
	<div class="contain">
		<div class="left-top">
			<img src="${pageContext.request.contextPath}/img/10.jpg" width="92"
				height="92" class="img-circle" style="margin-top: 50px;">
			<div style="padding-top: 10px;"  class="cguname">
				${username}
			</div>
		</div>
		<div class="main">
			<div class="head">
				<font size="4px;" style="position: absolute; left: 20px;">个人信息</font>
				<a data-toggle="modal" href="#myModal"
					style="position: relative; float: right; color: #666666; cursor: pointer;"
					onclick=""><span class="glyphicon glyphicon-pencil"></span>编辑</a>
			</div>
			<div class="line" style="margin-bottom: 20px; width: 936px;"></div>
			<div class="info-wapper">
				<div class="info-box">
					<label class="pull-left" style="background-color: #F3F5F7;">昵称</label>
					<div class="pull-left cguname" >${sessionScope.userInfo.uname}</div>
				</div>
				<div class="info-box">
					<label class="pull-left" style="background-color: #F3F5F7">密码</label>
					<div class="pull-left" id="passdiv">${sessionScope.userInfo.password}</div>
				</div>
				<div class="info-box">
					<label class="pull-left" style="background-color: #F3F5F7">电话</label>
					<div class="pull-left" id="telediv">${sessionScope.userInfo.tele }
	</div>
				</div>
				<div class="info-box">
					<label class="pull-left" style="background-color: #F3F5F7">地址</label>
					<div class="pull-left" id="addressdiv">${sessionScope.userInfo.address}
	</div>
				</div>
			</div>
		</div>
		<div class="left-bottom">
			<h3 align="center" style="width: 168px; height: 24px;">账号管理</h3>
			<div class="line" style="margin: 0 24px;"></div>
			<ul class="menu">
				<li ><a href="#">账号绑定<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
				<li><a  href="#">个人信息<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
				<li><a  href="#">操作记录<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
				<li><a  href="#">实名认证<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
				<li><a  href="#">学籍认证<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
				<li><a  href="#">收货地址<span
						class="glyphicon glyphicon-chevron-right"
						style="padding-left: 60px;"></span></a></li>
			</ul>
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

</body>
</html>
<!-- 	模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <!--modal内容 -->

            <!--模态框头部-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>

            <!--模态框内容书写-->
            <div class="modal-body" style="height: 400px;">
                <!--修改界面-->
                <div style="padding: 50px 60px 10px;">
                    <!--form表单-->
                    <form class="bs-example bs-example-form" role="form" id="forminfo">
                        <!--输入框-->
                        <div class="input-group" style="margin-bottom: 15px;">
                            <!--label-->
                            <span class="input-group-addon"
                                  style="background-color:#F3F5F7; color: black;"> <span
                                    class="glyphicon glyphicon-user"> 昵 称</span>
							</span> <input type="text" class="form-control"
                                           placeholder="update your username"
                                           value="${sessionScope.userInfo.uname}" name="user.uname" id="uname">
                        </div>
                        <br>
                        <div class="input-group" style="margin-bottom: 15px;">
							<span class="input-group-addon"
                                  style="background-color: #F3F5F7; color: black;"> <span
                                    class="glyphicon glyphicon-lock"> 密 码</span>
							</span> <input type="text" class="form-control"
                                           placeholder="update your password"
                                           value="${sessionScope.userInfo.password}" name="user.password" id="pass"/>
                        </div>
                        <br>
                        <div class="input-group" style="margin-bottom: 15px;">
                            <!--label-->
                            <span class="input-group-addon"
                                  style="background-color: #F3F5F7; color: black;"> <span
                                    class="	glyphicon glyphicon-phone-alt"> 电 话</span>
							</span> <input type="text" class="form-control"
                                           placeholder="update your tele" value="${sessionScope.userInfo.tele}" name="user.tele" id="tele"/>
                        </div>
                        <br>
                        <div class="input-group" style="margin-bottom: 15px;">
                            <!--label-->
                            <span class="input-group-addon"
                                  style="background-color:#F3F5F7; color: black;"> <span
                                    class="glyphicon glyphicon-home"> 地 址</span>
							</span> <input type="text" class="form-control"
                                           placeholder="update your tele"
                                           value="${sessionScope.userInfo.address}" name="user.address" id="address"/>
                        </div>
                </div>
                <br>
                </form>
                <div style="float: right;">
                    <span style="margin-right:10px;"><button class="btn btn-primary" onclick="changeInfo()">修改</button></span>
                    <span><button class="btn btn-default" onclick="hidemodal()">取消</button></span>
                </div>
            </div>
            <!--修改界面-->

        </div>

    </div>
    <!--。modal-content-->

</div>
<!--modal-->