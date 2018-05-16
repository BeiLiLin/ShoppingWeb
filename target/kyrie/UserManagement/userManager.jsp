<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/nav-footer.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/BeAlert.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/blue.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/userManager.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/BeAlert.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/icheck.min.js"></script>
<title>用户管理</title>
<style>

</style>

</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
		<div class="containter">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" >
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" id="navbar-brand" href="http://localhost:8888/ShoppingWeb/UserManagement/index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;流云工作组</a>

			</div>
			<div class="navbar-collapse collapse navbar-right" id="showList">
				<ul class="nav navbar-nav">
					<li><a><span class="glyphicon "></span>&nbsp;&nbsp;工单</a></li>
					<li class=""><a class="login"><span class=" "></span> &nbsp;&nbsp;用户管理</a></li>
					<!-- 	struts超链接标签		-->
					<li>
						<a href="${pageContext.request.contextPath}/product/Commodity_display.action">商品管理</a>
					</li>
					<li><a>解决方案</a></li>
					<li><a >客户</a></li>
					<li><a >关于我们</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- start menu -->
	<div id = "sidebar">
		<ul>
				<li class= "active"><a><i></i><span>用户管理</span></a></li>
				<li><a href="${pageContext.request.contextPath}/product/Commodity_display.action"><i></i><span>商品管理</span></a></li>
				<li><a><i></i><span>购物车管理</span></a></li>
				<li><a><i></i><span>留言管理</span></a></li>
				<li><a><i></i><span>工单管理</span></a></li>
		</ul>
	
	</div>
	<!-- start conetent-->
	<div id = "content">
			<div id = "content-header">
					 <div id="content-nav"> <a href=""  class="tip-bottom"><i class="icon-home"></i> 用户管理</a></div>
			</div>
			<div id ="content-body">

		<div class="panel panel-info col-lg-12 col-md-12">
			<div class="panel-heading " style="height: 41px;"> <div style="float:left; font-size:18px"> <span class="glyphicon glyphicon-user" style="font-size:18px; color:#0d8498;">   </span>&nbsp;&nbsp;&nbsp;用户管理</div>
				<div class="input-group col-md-3 text-right "  style="top:-7px; float:right; dispaly:inline-block;">  
			     <div class=" dropdown " > 
			     <input type="text" class="form-control dropdown-toggle"  data-toggle="dropdown"  placeholder="请输入书名"  id ="search" onkeyup="getSearchText()" onfocus ="getSearchText()" > 
			    
			           <ul class ="dropdown-menu text-left"  style = "z-index:555" id="searchMenu">
	 		           			<li>一朵红色蒲公英</li>
	<!-- 		           			<li>色</li>
			           			<li>蒲</li>
			           			<li>公</li>
			           			<li>英</li>
			           			<li>出</li>	
			           			<li>品</li>	  -->           			
			           </ul>
			      </div>      
			            <span class="input-group-btn">  
			               <button class="btn btn-info btn-search" id ="searchBtn" data-toggle="dropdown">查找</button>  
			                
			            </span>  
			 </div>  
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover table-bordered"  id="tableShow">
						<tr class=" info">
							<th class="text-center"><span class="glyphicon glyphicon-stats">&nbsp; </span>序号</th>
							<th class="text-center"><span class="glyphicon glyphicon-sort-by-attributes">&nbsp;</span>编号</th>
							<th class="text-center"><span class="glyphicon glyphicon-th">&nbsp; </span>昵称</th>
							<th class="text-center"><span class="glyphicon glyphicon-user">&nbsp; </span>角色</th>
							<th class="text-center"><span class="glyphicon glyphicon-info-sign">&nbsp; </span>电话</th>
							<th class="text-center"><span class="glyphicon glyphicon-info-sign">&nbsp; </span>地址</th>
							<!-- <th class="text-center"><span class="glyphicon glyphicon-fire">&nbsp; </span>状态</th> -->							
							<th class="text-center"><span class="glyphicon glyphicon-pencil">&nbsp;</span>操作</th>
						</tr>
					<tbody id = "showTable">

					</tbody>
				
				</table>
			</div>
			<!--start  弹出层  -->
			<div class="modal fade" id="add-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title"><span class="glyphicon glyphicon-plus">&nbsp;</span><span id="Etid_header">添加图书</span></h4>
						</div>
						<div class="modal-body">
							<form class="form-group" >
								<!--编号-->
								<div class="form-inline">
								    <label class="col-sm-3 control-label">编号:</label>
								
								    <input class="form-control" type="text" placeholder="" id="uId">
								
								</div>  
								<div class="form-inline" style="display:none;" id="passwordText">
								    <label class="col-sm-3 control-label">密码:</label>
								
								    <input class="form-control" type="password" placeholder="" id="password">
								
								</div>  								
								<!--书名-->
								<div class="form-inline">
								    <label class="col-sm-3 control-label">昵称:</label>
								
								    <input class="form-control long-input" type="text" placeholder="" id="uName">
								
								</div>  
								<!--作者-->
								<div class="form-inline">
								    <label class="col-sm-3 control-label">电话:</label>
								
								    <input class="form-control" type="text" placeholder="" id="tele">
								
								</div>  
								<!--出版日期-->
								<div class="form-inline">
								    <label class="col-sm-3 control-label">地址:</label>
								
								    <input class="form-control long-input" type="text" placeholder="如：北理工34栋-705" id="address">
								
								</div>  		
						
								<!--状态-->
								<div class="form-inline">
									<label class="col-sm-3 control-label">角色:</label>
								    <div class="radio ">
								        <label>
								          <input  type="radio"  name="iCheck" checked="checked" value="2"/> 管理员 
								        </label>
							        
								    </div>					
								    <div class="radio ">
								        <label>
								          <input  type="radio"  name="iCheck" value="0"/> 普通用户 
								        </label>
							        
								    </div>	
								    <div class="radio ">
								        <label>
								          <input  type="radio" name="iCheck" value="1"/> 商家 
								        </label>
							        
								    </div>	
								</div>				    
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="save()">保存</button>
						</div>
					</div>
				</div>
			</div>
			<!--end  弹出层  -->			
			
			<div class="panel-footer text-center" id= "panel-footer">
				<span class="text-center">
				<ul class="pagination">
					<li><a href="#">首页</a></li>
					<li><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
					<li><a href="#">尾页</a></li>
				</ul>
				</span>
				
				<button class="btn btn-primary " onclick="add()" >添加</button>
				<button class="btn btn-default " id = "deleteBtn">删除</button>
				<button class="btn btn-default  " id = "selectAll">全选</button>
			</div>
		</div>
			
			</div>
			<div id = "content-footer"></div>
	</div>

	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userManager.js"></script>
</body>
</html>