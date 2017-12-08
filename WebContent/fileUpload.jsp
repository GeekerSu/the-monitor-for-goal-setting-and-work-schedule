<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

body {
	background-color: #0CA3D2
}
</style>
<title>File Management</title>

<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="banner">
<nav class="navbar navbar-default">
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					 <ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="services.html">Services</a></li>
						
						<li><a href="contact.html">Contact Us</a></li>
					  </ul>
					</div>
					</nav>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">ReadingNotes</a>
		</div>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
	
		<div>
			<ul class="nav navbar-nav">
				<!-- 				<li><a href="home.jsp">首页</a></li> -->
				<li><a href="#">阅读笔记</a></li>
				<li><a href="down_list.action">我的文件</a></li>
				<li class="active"><a href="#fileUpload.jsp">上传文件</a></li>
				<li><a href="getTree.action">分类树</a></li>
				<li><a href="userLog.action">用户日志</a>
				<li><a href="readingTimeLine.action">阅读时间线</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> UserID:<s:property value="#session.username" /><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>
	<div class="col-md-12">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#PDF" data-toggle="tab"> 上传PDF文件 </a></li>
			<li><a href="#URL" data-toggle="tab">上传URL</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="PDF">
				<form action="upload" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">

					<div class="form-group">
					<div class="col-md-4">
						<label for="myFile">请选择要上传的文件：</label>
						
							<div class="fileinput fileinput-new input-group" data-provides="fileinput">
								<div class="form-control" data-trigger="fileinput">
									<i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span>
								</div>
								<span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="myFile"></span> <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</div>

					<div class="form-group">
					<div class="col-md-4">
						<label for="pnode">请选择文件所属分类：</label><br>
						
							<select id="pnode" name="pnode">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-default" value="Upload">确定</button>
				</form>
			</div>
			<div class="tab-pane fade" id="URL">
				<form action="uploadURL" method="post" class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-md-4">
							<label for="bookName">请输入文献名称：</label> <input type="text" class="form-control" name="bookName" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<label for="bookName">请输入URL：</label> <input type="text" class="form-control" name="bookURL" value="http://" />
						</div>
					</div>
					<div class="form-group">
					<div class="col-md-4">
						<label for="pnode">请选择URL所属分类：</label><br>
						
							<select id="pnode" name="pnode">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-default" value="UploadURL">确定</button>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>