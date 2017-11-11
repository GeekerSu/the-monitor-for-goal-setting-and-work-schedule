<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Reading Condition</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
	<a href="logout.action">Logout</a>
	<br /> user:
	<s:property value="#session.username" />
	<br />
</div>	
<div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#All" data-toggle="tab"> 所有文件 </a></li>
		<li><a href="#Unread" data-toggle="tab">未阅读</a></li>
		<li><a href="#RoughlyRead" data-toggle="tab">已粗读</a></li>
		<li><a href="#DetailedRead" data-toggle="tab">已精读</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="All">
			<p>
			<div class="container">
				<div class="row">
				<div class="col-md-9"
						style="box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
					<table cellpadding="10" cellspacing="10"
							class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>文件名</th>
								<th colspan="3" style="text-align:center">文件操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileNames}" var="fileName" varStatus="fn">
								<tr>
									<td>${fn.count}</td>
									<td>${fileName}</td>
									<td>
										<!-- 构建一个url --> <c:url var="url" value="down_down">
											<c:param name="fileName" value="${fileName}"></c:param>
										</c:url> <a href="${url }">下载</a>
									</td>
									<td><c:url var="urlview" value="down_view">
											<c:param name="fileName" value="${fileName}"></c:param>
										</c:url> <a href="${urlview}">阅读</a></td>
									<td><c:url var="urldelete" value="delete">
											<c:param name="fileName" value="${fileName}"></c:param>
										</c:url> <a href="${urldelete}">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a style="text-align:center" href="fileUpload.jsp">上传文件</a>
				</div>
			</div>
		</div>
		</p>
			
	</div>
	<div class="tab-pane fade" id="Unread">
			<p>
			<div class="container">
				<div class="row">
				<div class="col-md-9"
						style="box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
					<table cellpadding="10" cellspacing="10"
							class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>文件名</th>
								<th colspan="3" style="text-align:center">文件操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileNamesUnread}" var="fileNameU" varStatus="fn">
								<tr>
									<td>${fn.count}</td>
									<td>${fileNameU}</td>
									<td>
										<!-- 构建一个url --> <c:url var="url" value="down_down">
											<c:param name="fileName" value="${fileNameU}"></c:param>
										</c:url> <a href="${url }">下载</a>
									</td>
									<td><c:url var="urlview" value="down_view">
											<c:param name="fileName" value="${fileNameU}"></c:param>
										</c:url> <a href="${urlview}">阅读</a></td>
									<td><c:url var="urldelete" value="delete">
											<c:param name="fileName" value="${fileNameU}"></c:param>
										</c:url> <a href="${urldelete}">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a style="text-align:center" href="fileUpload.jsp">上传文件</a>
				</div>
			</div>
		</div>
		</p>
		
	</div>
	<div class="tab-pane fade" id="RoughlyRead">
		<p>
			<div class="container">
				<div class="row">
				<div class="col-md-9"
						style="box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
					<table cellpadding="10" cellspacing="10"
							class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>文件名</th>
								<th colspan="3" style="text-align:center">文件操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileNamesRoughly}" var="fileNameR" varStatus="fn">
								<tr>
									<td>${fn.count}</td>
									<td>${fileNameR}</td>
									<td>
										<!-- 构建一个url --> <c:url var="url" value="down_down">
											<c:param name="fileName" value="${fileNameR}"></c:param>
										</c:url> <a href="${url }">下载</a>
									</td>
									<td><c:url var="urlview" value="down_view">
											<c:param name="fileName" value="${fileNameR}"></c:param>
										</c:url> <a href="${urlview}">阅读</a></td>
									<td><c:url var="urldelete" value="delete">
											<c:param name="fileName" value="${fileNameR}"></c:param>
										</c:url> <a href="${urldelete}">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a style="text-align:center" href="fileUpload.jsp">上传文件</a>
				</div>
			</div>
		</div>
		</p>
	</div>
	<div class="tab-pane fade" id="DetailedRead">
		<p>
			<div class="container">
				<div class="row">
				<div class="col-md-9"
						style="box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
					<table cellpadding="10" cellspacing="10"
							class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>文件名</th>
								<th colspan="3" style="text-align:center">文件操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileNamesDetailed}" var="fileNameD" varStatus="fn">
								<tr>
									<td>${fn.count}</td>
									<td>${fileNameD}</td>
									<td>
										<!-- 构建一个url --> <c:url var="url" value="down_down">
											<c:param name="fileName" value="${fileNameD}"></c:param>
										</c:url> <a href="${url }">下载</a>
									</td>
									<td><c:url var="urlview" value="down_view">
											<c:param name="fileName" value="${fileNameD}"></c:param>
										</c:url> <a href="${urlview}">阅读</a></td>
									<td><c:url var="urldelete" value="delete">
											<c:param name="fileName" value="${fileNameD}"></c:param>
										</c:url> <a href="${urldelete}">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a style="text-align:center" href="fileUpload.jsp">上传文件</a>
				</div>
			</div>
		</div>
		</p>
	</div>
</div>
</div>
</body>
</html>
