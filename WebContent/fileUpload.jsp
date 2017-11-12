<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<style>
.city {
	margin: 5px;
	padding: 20px;
	width: 100%;
	background-color: #F9F9F9;
}

.city1 {
	float: left;
	margin: 5px;
	padding: 5px;
	width: 70%;
	border: 1px;
}

.editor {
	width: 100%;
	height: 100%;
}
</style>
<title>File Management</title>
	<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">文献阅读笔记</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">首页</a></li>
				<li><a href="#">阅读笔记</a></li>
				<li><a href="#">我的文件</a></li>
				<li class="active"><a href="#">文件管理</a></li>
			</ul>		
			<ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                   <span class="glyphicon glyphicon-user"></span> UserID:<s:property value="#session.username" /><b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
						<li><a href="login.jsp">登出</a></li>
				</ul>          
            </li>
        </ul>
			
		</div>
		</div>
</nav>
<div class="col-md-8" >
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#PDF" data-toggle="tab"> 上传PDF文件 </a></li>
		<li><a href="#URL" data-toggle="tab">上传URL</a></li>
		<li><a href="#ClassTree" data-toggle="tab">文献分类树</a></li>
		<li><a href="#TimeLine" data-toggle="tab">阅读时间线</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="PDF">
		<form action="upload" method="post" enctype="multipart/form-data">
			<div class="form-group">
			<label for="myFile">请选择要上传的文件：</label>
			<input type="file" id="inputfile" name="myFile"/>
			<button type="submit" class="btn btn-default" value="Upload">确定</button>
			</div>
		</form>			
	</div>
	<div class="tab-pane fade" id="URL" >
		<form action="uploadURL" method="post" class="form-horizontal" role="form">
		<div class="form-group">
		<div class="col-md-4">
		<label for="bookName">请输入文献名称</label>
		<input type="text" class="form-control" name="bookName" />
		</div>
		</div>
		<div class="form-group">
		<div class="col-md-4">
		<label for="bookName">请输入URL</label>
		<input type="text" class="form-control" name="bookURL" value="http://"/>
		</div>
		</div>
		<button type="submit" class="btn btn-default" value="UploadURL">确定</button>
		</form>
	</div>
	<div class="tab-pane fade" id="ClassTree">
		<p>文献分类树实现</p>
	</div>
	<div class="tab-pane fade" id="TimeLine">
		<p>阅读时间线实现</p>
	</div>
</div>
</div>
<%@ include file="bottom.jsp" %>
</body>
</html>