<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册页面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/regist.css"
	rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/nav-footer.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ConfirmAlert.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/BeAlert.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/regist.js"></script>
</head>
<body>
<div id="contain">
	<div id="head">
			<%@ include file="/inc/nav.jsp"%>
	</div>
	<div id="left">
	</div>
	<div id="main">
		<h1 class="text-muted">注册界面</h1>
		<hr>
		<s:form action="User_regist" namespace="/user" theme="simple" >
			<div class="input-group formdiv" >
							
							<span class="input-group-addon labelform ">	
							<span class="glyphicon glyphicon-user"> <s:label>用户账号</s:label></span>
							</span>
							<s:textfield type="text" cssClass="form-control " cssStyle="width:59%" placeholder="input your email"
							 name="user.uid" id="uid" onblur="checkuserid()"/>
							 <span id="uidspan" style="padding-left:20px;"></span>						
			</div><br>
			<div class="input-group formdiv" >
							
							<span class="input-group-addon labelform">	
							<span class="glyphicon glyphicon-user"> 用户昵称</span>
							</span>
							<s:textfield type="text" cssClass="form-control" id="uname" cssStyle="width:59%" name="user.uname" placeholder="input your username" onblur="checkUname()"/>
							<span id="nameSpan" style="padding-left:20px;"></span>
			</div><br>
			<div class="input-group formdiv" >
							
							<span class="input-group-addon labelform" >	
							<span class="glyphicon glyphicon-user" > 用户密码</span>
							</span>
							<s:textfield type="password" name="user.password" id="pass" cssClass="form-control " cssStyle="width:59%" placeholder="input your password" onblur="checkPass()"/>
							<span id="passSpan" style="padding-left:20px;"></span>
							
			</div><br>
			<div class="input-group formdiv" > 
							<span class="input-group-addon labelform" >
							<span class="glyphicon glyphicon-lock"> 确认密码</span>
							</span>
							<s:textfield type="password" cssClass="form-control" id="confirmPass" cssStyle="width:59%" placeholder="confirm your password" onblur="ConfirmPass()"/>
							<span id="ConfirmPassSpan" style="padding-left:20px;"></span>
			</div><br>
			<div class="input-group formdiv" >
							<span class="input-group-addon labelform" >
							<span class="glyphicon glyphicon-lock"> 地 &nbsp址</span>
							</span>
							<s:textfield type="text" name="user.address" cssClass="form-control " cssStyle="width:59%" placeholder="input your address" />
							
			</div><br>
			<div class="input-group formdiv">
							<span class="input-group-addon labelform" >
							<span class="glyphicon glyphicon-lock">电话 号码</span>
							</span>
							<s:textfield type="text" name="user.tele" cssClass="form-control " id="tele" cssStyle="width:59%" placeholder="input your Tele" onblur="CheckTele()" />
							<span id="TeleSpan" style="padding-left:20px;"></span>
			</div><br>
			<hr>
			<s:textfield type="submit" value="注册" cssClass="btn btn-primary btn-lg" cssStyle="float: right;padding-right:30px"/>
		</s:form>
	</div>
	<div id="right">
	</div>
<!-- 	<div id="footer"></div> -->
</div>	
</body>
</html>