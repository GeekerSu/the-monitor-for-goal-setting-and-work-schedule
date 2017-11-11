<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>File Management</title>
	<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<a href="down_list.action">我的文件</a>
<div class="col-md-12" >
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#PDF" data-toggle="tab"> 上传PDF文件 </a></li>
		<li><a href="#URL" data-toggle="tab">上传URL</a></li>
		<li><a href="#ClassTree" data-toggle="tab">文献分类树</a></li>
		<li><a href="#TimeLine" data-toggle="tab">阅读时间线</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="PDF">
		<p>
			<form action="upload" method="post" enctype="multipart/form-data">
			<label for="myFile">Upload your file</label>
			<br/>
			<input type="file" name="myFile"/>
			<input type="submit" value="Upload"/>
			</form>
		</p>			
	</div>
	<div class="tab-pane fade" id="URL">
		<p>
		<form action="uploadURL" method="post" >
		<label >上传URL</label>
		<br/>
		BookName:<input type="text" name="bookName" />
		<br/>
		BookURL:<input type="text" name="bookURL" value="http://"/>
		<br/>
		<input type="submit" value="UploadURL"/>
		</form>
		</p>
	</div>
	<div class="tab-pane fade" id="ClassTree">
		<p>文献分类树实现</p>
	</div>
	<div class="tab-pane fade" id="TimeLine">
		<p>阅读时间线实现</p>
	</div>
</div>
</div>
</body>
</html>