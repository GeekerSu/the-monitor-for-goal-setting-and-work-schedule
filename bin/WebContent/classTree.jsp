<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Class Tree</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.7/js/jasny-bootstrap.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<script type="text/javascript" src="js/dtree.js"></script>
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
	margin-bottom: 200px;
	background-color: #0CA3D2
}
</style>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Macrosoft</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<!-- 				<li> -->
				<!-- 					<a href="home.jsp">首页</a> -->
				<!-- 				</li> -->
				<li><a href="#">阅读笔记</a></li>
				<li><a href="down_list.action">我的文件</a></li>
				<li><a href="FetchClasses.action">上传文件</a></li>
				<li class="active"><a href="getTree.action">分类树</a></li>
				<li><a href="userLog.action">用户日志</a>
				<li><a href="readingTimeLine.action">阅读时间线</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> UserID:<s:property value="#session.username" /><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>
	<div class="col-md-12">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#NEW" data-toggle="tab"> 新建分类 </a></li>
			<li><a href="#CHANGE" data-toggle="tab">更改论文所在分类</a></li>
			<li><a href="#DELETE" data-toggle="tab">删除分类</a></li>
			<li><a href="#DOWNMULTI" data-toggle="tab">批量下载</a></li>

		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="NEW">
				<div class="row">
					<div class="col-md-4">
						<h4>分类树</h4>
						<div class="dtree" style="border-radius: 4px; inset; border: 2px solid #DCDCDC;">
							<p>
								<a href="javascript: d.openAll();">open all</a> <a href="javascript: d.closeAll();">close all</a>
							</p>
							<script type="text/javascript">
								d = new dTree('d');
								<s:iterator value="list" >
								d.add(<s:property value="ID"/>,
										<s:property value="PID"/>,
										'<s:property value="nodeName"/>',
										'getTree.action');
								</s:iterator>
								document.write(d);
							</script>
						</div>
					</div>
					<div class="col-md-8">
						<form action="addClassNode" class="form-horizontal">
							<h4>新建类</h4>
							<label for="bookName">新类名：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="newclass" />
								</div>
							</div>
							<label for="bookName">父结点：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="parent" />
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="CHANGE">
				<div class="row">
					<div class="col-md-4">
						<h4>分类树</h4>
						<div class="dtree" style="border-radius: 4px; inset; border: 2px solid #DCDCDC;">
							<p>
								<a href="javascript: p.openAll();">open all</a> <a href="javascript: p.closeAll();">close all</a>
							</p>
							<script type="text/javascript">
								p = new dTree('p');
								<s:iterator value="list" >
								p.add(<s:property value="ID"/>,
										<s:property value="PID"/>,
										'<s:property value="nodeName"/>',
										'getTree.action');
								</s:iterator>
								document.write(p);
							</script>
						</div>
					</div>
					<div class="col-md-8">
						<form action="addBookNode" class="form-horizontal">
							<h4>更改分类</h4>
							<label for="bookName">文献/类名称：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="bookName" />
								</div>
							</div>
							<label for="bookName">父结点：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="parentb" />
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="DELETE">
				<div class="row">
					<div class="col-md-4">
						<h4>分类树</h4>
						<div class="dtree" style="border-radius: 4px; inset; border: 2px solid #DCDCDC;">
							<p>
								<a href="javascript: q.openAll();">open all</a> <a href="javascript: q.closeAll();">close all</a>
							</p>
							<script type="text/javascript">
								q = new dTree('q');
								<s:iterator value="list" >
								q.add(<s:property value="ID"/>,
										<s:property value="PID"/>,
										'<s:property value="nodeName"/>',
										'getTree.action');
								</s:iterator>
								document.write(q);
							</script>
						</div>
					</div>
					<div class="col-md-8">
						<form action="deleteNode" class="form-horizontal">
							<h4>删除分类</h4>
							<label for="nodeToDelete">文献/类名称：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="nodeToDelete" />
								</div>
							</div>
							<button type="submit" class="btn btn-default" />
							删除
							</button>
						</form>
					</div>
				</div>
			</div>


			<div class="tab-pane fade" id="DOWNMULTI">
				<div class="row">
					<div class="col-md-4">
						<h4>分类树</h4>
						<div class="dtree" style="border-radius: 4px; inset; border: 2px solid #DCDCDC;">
							<p>
								<a href="javascript: r.openAll();">open all</a> <a href="javascript: r.closeAll();">close all</a>
							</p>
							<script type="text/javascript">
								r = new dTree('r');
								<s:iterator value="list" >
								r.add(<s:property value="ID"/>,
										<s:property value="PID"/>,
										'<s:property value="nodeName"/>',
										'getTree.action');
								</s:iterator>
								document.write(r);
							</script>
						</div>
					</div>
					<div class="col-md-8">
						<form action="down_multi" class="form-horizontal">
							<h4>批量下载</h4>

							<label for="classNodeName">下载结点：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="classNodeName" />
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>