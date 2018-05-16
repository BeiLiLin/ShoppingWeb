<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'Commodity.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/nav-footer.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
body {
	background: url("../css/B1.jpg");
}

#main {
	margin: 5px auto;
	width: 1000px;
	margin-left: 252px;
}

table {
	magin: auto;
	padding: 30px
}

form {
	margin: 97px auto 3px;
}

input {
	display: inline;
	height: 40px;
	width: 500px;
	margin-left: 100px;
	padding-left: 0px;
	margin-bottom: 34px;
}

select {
	border: none;
	display: inline;
	left: 600px;
	height: 40px;
	margin-left: 0px;
	padding-left: 0px;
}

#submit {
	display: inline;
	position: absolute;
	border: none;
	width: 45px;
	height: 40px;
	margin: 0px;
	background: url(${pageContext.request.contextPath}/img/s_but.png)
		no-repeat;
}

#ch {
	width: 15px;
	height: 15;
	margin: 0px;
	padding: 0px;
	right: 0;
	/*position:absolute;*/
}

#main span {
	clear: both;
	margin: 0;
	float: right;
}
#main i{
	position: absolute;
    top: 12px;
    font-style: normal;
    color: #584d4d;
}
#main tr {
	width: 1000px
}

#main tr th {
	margin-right: 30px;
	width: 120px;
}

#main tr td {
	margin-right: 30px;
	width: 120px;
}

#float-bar {
	width: 300px;
	height: 50px;
	background: rgba(229, 229, 229, 0);
	position: fixed;
	margin: 0px;
	float: left;
	left: 0;
	right: 0;
	bottom: 0px;
	line-height: 50px;
}

.btn {
	width: 70px;
	display: inline;
	margin: 5px 10px;
}
</style>


</head>

<body>
	<%@ include file="/inc/nav.jsp"%>
	<div id="main">
		<s:form action="Commodity_editCommodity" method="post"
			namespace="/product" id="form1">
			<s:iterator value="#session.cdy">
					<div style="width:500px ;height:40px;">
			<input type="hidden" name="cid" value="<s:property value="cid" />">
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>商品名</i></label><input type="text" name="cname" value="<s:property value="cname" />"></span>
			</div>
			
			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>售&nbsp价：</i></label><input type="text" name="cost" value="<s:property value="cost" />"></span>
			</div>

			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>信&nbsp息：</i></label><input type="text" name="info" value="<s:property value="info" />"></span>
			</div>



			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>分&nbsp类：</i></label>	<input type="text" name="classify" value="<s:property value="classify" />"></span>
			</div>

			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>图&nbsp片：</i></label><input type="text" name="pic" value="<s:property value="pic" />"></span>
			</div>

			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px;" for="#nameinput"><i>制造商：</i></label>	<input type="text" name="merchant" value="<s:property value="merchant" />"></span>
			</div>

			<div style="width:500px ;height:40px;">		
			<span style="width:400px;"><label style="margin:0 auto;  position: relative; width:60px; " for="#nameinput"><i>库&nbsp存：</i></label><input type="text" name="store" value="<s:property value="store" />"></span>
			</div>
			</s:iterator>
		</s:form>
	</div>

	<div id="float-bar">
		<input type="submit" class="btn" style="background-color: rgba(61, 77, 101, 0.55); color: white;"
			onclick="tijao()" value="确定">
			<script type="text/javascript">
				function tijao(){
					
					document.getElementById('form1').submit();
					alert("提交成功！");
				}
				
			</script>
		<input type="reset" class="btn" style="background-color: rgba(61, 77, 101, 0.55); color: white;"
			onclick="document.getElementById('form1').reset()" disabled="true"
			value="重置">
		<a style ="text-decoration:none;" href="http://localhost:8888/ShoppingWeb/product/Commodity_display.action">
		<input type="button" class="btn" value="取消" style="background-color: rgba(61, 77, 101, 0.55); color: white;">
		</a>
	</div>


</body>
</html>
