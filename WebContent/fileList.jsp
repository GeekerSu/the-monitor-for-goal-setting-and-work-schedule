<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>My Files</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">

<%--tab style --%>
<link rel='stylesheet prefetch' href='css/tabStyle/reset.css'>
<link rel="stylesheet" type="text/css" href="css/tabStyle/default.css">
<link rel="stylesheet" type="text/css" href="css/tabStyle/styles.css">
<%--tab style --%>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>

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
	background: url(img/bgp.jpg) no-repeat;
	background-size:cover;
}

.double {
	position: relative;
	margin: 0 auto;
	padding: 20px 20px 20px;
	background: white;
	border-radius: 3px;
	-webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px
		rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px
		rgba(0, 0, 0, 0.3);
}

.double:before {
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

.frame {
	position: relative;
	margin: 0 auto;
	padding: 20px 20px 20px;
	background: white;
	border-radius: 3px;
	-webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px
		rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px
		rgba(0, 0, 0, 0.3);
}

.frame:before {
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
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Macrosoft</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<!-- 				<li><a href="home.jsp">首页</a></li> -->
				<li class="active"><a href="down_list.action">我的文件</a></li>
				<li><a href="FetchClasses.action">上传文件</a></li>
				<li><a href="getTree.action">分类树</a></li>
				<li><a href="userLog.action">用户日志</a>
				<li><a href="readingTimeLine.action">阅读时间线</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> UserID:<s:property value="#session.username" /><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="logout.action">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>
	<div class="tabs" style="width: 1200px;margin-top:40px">
		<div class="tabs-header">
			<div class="border"></div>
			<ul>
				<li class="active"><a href="#All" tab-id="1" ripple="ripple" ripple-color="#FFF">所有文件 </a></li>
				<li><a href="#Unread" tab-id="2" ripple="ripple" ripple-color="#FFF">未阅读</a></li>
				<li><a href="#RoughlyRead" tab-id="3" ripple="ripple" ripple-color="#FFF">已粗读</a></li>
				<li><a href="#DetailedRead" tab-id="4" ripple="ripple" ripple-color="#FFF">已精读</a></li>
			</ul>
			<nav class="tabs-nav"> <i id="prev" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;<&nbsp;</i> <i id="next" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;>&nbsp;</i></nav>
		</div>
		<div class="tabs-content">
			<div tab-id="1" class="tab active">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table cellpadding="10" cellspacing="10" class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th colspan="4" style="text-align: center">文件操作</th>
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
											<td><c:url var="urlshare" value="share">
													<c:param name="fileName" value="${fileName}"></c:param>
												</c:url> <a href="${urlshare}" target="blank">分享</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br />
			</div>
			<div tab-id="2" class="tab">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table cellpadding="10" cellspacing="10" class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th colspan="3" style="text-align: center">文件操作</th>
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
											<td><c:url var="urlshare" value="share">
													<c:param name="fileName" value="${fileNameU}"></c:param>
												</c:url> <a href="${urlshare}">分享</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br />
			</div>
			<div tab-id="3" class="tab">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table cellpadding="10" cellspacing="10" class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th colspan="3" style="text-align: center">文件操作</th>
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
											<td><c:url var="urlshare" value="share">
													<c:param name="fileName" value="${fileNameR}"></c:param>
												</c:url> <a href="${urlshare}">分享</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br />
			</div>
			<div tab-id="4" class="tab">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table cellpadding="10" cellspacing="10" class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th colspan="3" style="text-align: center">文件操作</th>
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
											<td><c:url var="urlshare" value="share">
													<c:param name="fileName" value="${fileNameD}"></c:param>
												</c:url> <a href="${urlshare}">分享</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>
	<script src='js/stopExecutionOnTimeout.js?t=1'></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-3.1.1.min.js"><\/script>')
	</script>
	<script>
		$(document)
				.ready(
						function() {
							var activePos = $('.tabs-header .active')
									.position();
							function changePos() {
								activePos = $('.tabs-header .active')
										.position();
								$('.border').stop().css({
									left : activePos.left,
									width : $('.tabs-header .active').width()
								});
							}
							changePos();
							var tabHeight = $('.tab.active').height();
							function animateTabHeight() {
								tabHeight = $('.tab.active').height();
								$('.tabs-content').stop().css({
									height : tabHeight + 'px'
								});
							}
							animateTabHeight();
							function changeTab() {
								var getTabId = $('.tabs-header .active a')
										.attr('tab-id');
								$('.tab').stop().fadeOut(300, function() {
									$(this).removeClass('active');
								}).hide();
								$('.tab[tab-id=' + getTabId + ']').stop()
										.fadeIn(300, function() {
											$(this).addClass('active');
											animateTabHeight();
										});
							}
							$('.tabs-header a').on(
									'click',
									function(e) {
										e.preventDefault();
										var tabId = $(this).attr('tab-id');
										$('.tabs-header a').stop().parent()
												.removeClass('active');
										$(this).stop().parent().addClass(
												'active');
										changePos();
										tabCurrentItem = tabItems
												.filter('.active');
										$('.tab').stop().fadeOut(
												300,
												function() {
													$(this).removeClass(
															'active');
												}).hide();
										$('.tab[tab-id="' + tabId + '"]')
												.stop().fadeIn(300, function() {
													$(this).addClass('active');
													animateTabHeight();
												});
									});
							var tabItems = $('.tabs-header ul li');
							var tabCurrentItem = tabItems.filter('.active');
							$('#next').on(
									'click',
									function(e) {
										e.preventDefault();
										var nextItem = tabCurrentItem.next();
										tabCurrentItem.removeClass('active');
										if (nextItem.length) {
											tabCurrentItem = nextItem
													.addClass('active');
										} else {
											tabCurrentItem = tabItems.first()
													.addClass('active');
										}
										changePos();
										changeTab();
									});
							$('#prev').on(
									'click',
									function(e) {
										e.preventDefault();
										var prevItem = tabCurrentItem.prev();
										tabCurrentItem.removeClass('active');
										if (prevItem.length) {
											tabCurrentItem = prevItem
													.addClass('active');
										} else {
											tabCurrentItem = tabItems.last()
													.addClass('active');
										}
										changePos();
										changeTab();
									});
							$('[ripple]')
									.on(
											'click',
											function(e) {
												var rippleDiv = $('<div class="ripple" />'), rippleOffset = $(
														this).offset(), rippleY = e.pageY
														- rippleOffset.top, rippleX = e.pageX
														- rippleOffset.left, ripple = $('.ripple');
												rippleDiv
														.css(
																{
																	top : rippleY
																			- ripple
																					.height()
																			/ 2,
																	left : rippleX
																			- ripple
																					.width()
																			/ 2,
																	background : $(
																			this)
																			.attr(
																					'ripple-color')
																}).appendTo(
																$(this));
												window.setTimeout(function() {
													rippleDiv.remove();
												}, 1500);
											});
						});
	</script>



</body>
</html>

