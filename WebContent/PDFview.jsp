<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #0CA3D2
}
</style>
<title>阅读PDF</title>
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
				<li class="active"><a href="#">阅读笔记</a></li>
				<li><a href="down_list.action">我的文件</a></li>
				<li><a href="fileUpload.jsp">文件管理</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>
						UserID:<s:property value="#session.username" /><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>
	<div class="container">
		<div class="panel panel-default">
		<div class="row">
			<div class="col-md-8">
				<b>${fileName}</b><br />
				<iframe name="myframe" src="./pdfjs/viewer.html?file=../${filePath}" style="width:100%; height:720px"></iframe>
			</div>

			<div class="col-md-4">
				<b>阅读笔记</b>
						<s:form action="down_submit" >
						<textarea name="note" style="width:100%;height:450px;margin-top:10px;resize:vertical" placeholder="请输入笔记..."><s:property value="note"/></textarea>
						<br/>
						<b>阅读程度</b><br/>
							<s:radio label="ReadState" name="State" list="readState"
								value="defaultReadStateValue" theme="simple"/>
							<input type="hidden" name="fileName" value="${fileName }" />
							<s:submit value="submit" align="right"/>
						</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
