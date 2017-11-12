<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
	<title>Class Tree</title>
	<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css"rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="bootstrap-3.3.7/js/jasny-bootstrap.js"></script>
	<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
	<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="js/dtree.js"></script>

</head>
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
  background: #0ca3d2;
}
.login {
  position: relative;
  margin: 0 auto;
  padding: 20px 20px 20px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}
.login:before {
  content: '';
  position: absolute;
  top: -8px;
  right: -8px;
  bottom: -8px;
  left: -8px;
  z-index: -1;
  background: rgba(0, 0, 0, 0.08);
  border-radius: 4px;
}
</style>
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
				<li><a href="down_list.action">我的文件</a></li>
				<li><a href="fileUpload.jsp">上传文件</a></li>
				<li class="active"><a href="getTree.action">分类树</a></li>
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
	<div class="login">
	<div style="border-radius:4px;border:2px solid #a1a1a1;">
<div class="dtree" >
	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>
	<script type="text/javascript">
			d= new dTree('d');
			<s:iterator value="list" >
			d.add(<s:property value="ID"/>,
					<s:property value="PID"/>,
					'<s:property value="nodeName"/>',
					'getTree.action');
			</s:iterator>
			document.write(d);
	</script>
</div>
<a href="down_list.action">返回文件列表</a>
</div>
<form action="addClassNode" class="form-horizontal">
<h4>Create a new Class</h4>
<label for="bookName">当前节点</label>
<div class="form-group">
		<div class="col-md-4">
<input type="text" class="form-control" name="newclass" />
</div>
</div>
<label for="bookName">父节点</label>
<div class="form-group">
		<div class="col-md-4">
<input type="text" class="form-control" name="parent" />
</div>
</div>
<button type="submit" value="Create" class="btn btn-default"/>确定</button>
</form>
</div>
</body>

</html>