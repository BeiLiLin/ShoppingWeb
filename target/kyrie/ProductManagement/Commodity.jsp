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
	background:url("../css/B1.jpg");
}

#main {
	margin: 110px auto 0;
	width: 1000px;
}

table {
	magin: auto;
	padding: 30px
}

form {
	margin: 30px auto 3px;
	text-align: center;
	margin-bottom: 14px;
}

input {
	display: inline;
	height: 40px;
	width: 500px;
	margin-left: 100px;
	padding-left: 0px;
}

select {
	border: none;
	display: inline;
	left: 600px;
	height: 40px;
	margin-left: 0px;
	padding-left: 0px;
	background-color: rgba(80, 86, 103, 0.34);
	color: white;
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

.ch {
	width: 15px;
	height: 15;
	margin: 0px;
	padding: 0px;
	right: 0;
	/*position:absolute;*/
}

#main span {
	clear: both;
	margin: 20px;
	float: right;
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function deletel() {
		var a = new String;
		var i = 0;
		$("input.ch[type='checkbox']:checked").each(function() {
			if (a == "")
				a = $(this)[i].value;
			else
				a = a + "," + $(this)[i].value;
		});
		$.post('/ShoppingWeb/product/Commodity_deleteCommodity', {
			"A" : a
		}, function() {
			alert("删除成功");
			$("input.ch[type='checkbox']:checked").each(function() {
				var id = $(this).val();
				$("#" + id + "tr").remove();
			});
		});
	}

	function edit() {
		var j = 0;
		var id;
		$("input.ch[type='checkbox']:checked").each(function() {
			id = $(this).val();
			j++
		});
		if (j > 1)
			alert("一次只能选择一种商品修改");
		else if (j == 1) {
			$
					.post(
							'/ShoppingWeb/product/Commodity_display',
							{
								"ed" : true,
								"col" : "cid",
								"prt_val" : id + ""
							},
							function() {
								window.location.href = "${pageContext.request.contextPath}/ProductManagement/editcd.jsp"
							})
		}
	}
</script>

</head>

<body>
	<%@ include file="/inc/nav.jsp"%>
	<div id="main">
		<s:form action="Commodity_display" method="post" namespace="/product">
			<input type="text" name="prt_val">
			<select name="col">
				<option value="10">&nbsp&nbsp&nbsp全选</option>
				<option value="cid">商品编号</option>
				<option value="cname">商品名</option>
				<option value="classify">分类</option>
				<option value="merchant">制造商</option>
			</select>
			<input type="submit" id="submit" value="">
		</s:form>
		<table
			class="table  table-bordered table-condensed table-hover" style="background-color:rgba(250, 250, 250, 0.79) ">
			<thead>
				<tr>

					<th>操作</th>

					<th>商品编号</th>
					<th>商品名字</th>
					<th>商品价格</th>
					<th>商品信息</th>
					<th>产品类型</th>
					<th>图片</th>
					<th>商家</th>
					<th>库存</th>
				</tr>
			</thead>
			<tbody>

				<s:iterator value="#session.cdy">
					<tr id="<s:property value="cid"/>tr">
						
						<td ><input type="checkbox" class="ch checkbox" style="width:20px; display: inline-block;" value="<s:property value="cid"/>"></td>
						<td><span><s:property value="cid" /></span></td>
						<td><span><s:property value="cname" /></span></td>
						<td><span><s:property value="cost" /></span></td>
						<td><span><s:property value="info" /></span></td>
						<td><span><s:property value="classify" /></span></td>
						<td><span><img src="../img/<s:property value="pic"/>"
								width="80px" height="80px"></span></td>
						<td> <span><s:property value="Merchant" /></span></td>
						<td><span><s:property value="store" /></span></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>


	</div>

	<div id="float-bar">
		<input type="button" class="btn" onclick="deletel()" value="删除" style="	background-color: rgba(61, 77, 101, 0.55);color: white;">
		<a style="text-decoration: none;"
			href="${pageContext.request.contextPath}/ProductManagement/chargecd.jsp"><input
			type="submit" class="btn" value="添加" style="	background-color: rgba(61, 77, 101, 0.55);color: white;"></a> <input type="button"
			class="btn" onclick="edit()" value="修改" style="	background-color: rgba(61, 77, 101, 0.55);color: white;">
	</div>


</body>
</html>
