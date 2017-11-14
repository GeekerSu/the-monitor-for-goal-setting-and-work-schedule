<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Logs</title>
	<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css"rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">

<script src="js/jquery-3.1.1.min.js"></script>
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
<!-- 				<li><a href="home.jsp">首页</a></li> -->
				<li><a href="#">阅读笔记</a></li>
				<li><a href="down_list.action">我的文件</a></li>
				<li><a href="fileUpload.jsp">上传文件</a></li>
				<li><a href="getTree.action">分类树</a></li>
				<li class="active"><a href="userLog.action">用户日志</a>
				<li><a href="readingTimeLine.action">阅读时间线</a>
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

<div class="myTabContent" id="tab-content">
<div class="tab-pane fade in active" id="All">
			<div class="container">
				<div class="row">
				<div class="col-md-12">
					<table cellpadding="10" cellspacing="10"
							class="table table-striped">
						<thead>
							<tr>
								<th>操作</th>
								<th>时间</th>
							</tr>
						</thead>
						<tbody>	
						<s:iterator value="logList" status="stat">				
								<tr>
									<td><s:property value="Operation" /></td>
									<td><s:property value="Time"/></td>
								</tr>
								</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>