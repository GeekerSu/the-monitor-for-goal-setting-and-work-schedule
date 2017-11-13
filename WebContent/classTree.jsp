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
	<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="kindeditor/themes/default/default.css" rel="stylesheet">
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="js/dtree.js"></script>

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
				<li><a href="down_list.action">我的文件</a></li>
				<li><a href="fileUpload.jsp">上传文件</a></li>
				<li class="active"><a href="getTree.action">分类树</a></li>
				<li><a href="userLog.action">用户Log日志</a>
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
<div class="dtree">
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
<div>
<a href="down_list.action">返回文件列表</a>
<br/>
<h3>Create a new Class</h3>
<br/>
<form action="addClassNode">
ClassName:<input type="text" name="newclass" />
<br/>
ParentNode:<input type="text" name="parent" />
<br/>
<input type="submit" value="Create"/>
</form>
<h3>Add a book to a Class</h3>
<form action="addBookNode">
BookName:<input type="text" name="bookName"/>
<br/>
ParentNode:<input type="text" name="parentb"/>
<input type="submit" value="Create"/>
</form>
</div>


</body>

</html>