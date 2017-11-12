<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>下载的页面</title>
</head>
<body>

	<center>
		<div class="container">
			<div class="row">
				<div class="col-md-9" style="box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
					<table cellpadding="10" cellspacing="10"
						class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>文件名</th>
								<th colspan="3"  style="text-align:center">文件操作</th>
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

					<p>
						<a href="fileUpload.jsp">上传文件</a>
					</p>
				</div>
			</div>
		</div>
	</center>
</body>
</html>