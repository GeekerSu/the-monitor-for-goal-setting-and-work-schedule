<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>File Management</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-select.css" rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">
<%--tab style --%>
<link rel='stylesheet prefetch' href='css/tabStyle/reset.css'>
<link rel="stylesheet" type="text/css" href="css/tabStyle/default.css">
<link rel="stylesheet" type="text/css" href="css/tabStyle/styles.css">
<%--tab style --%>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.7/js/jasny-bootstrap.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap-select.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
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



		<div class="tabs" style="width: 1200px;">
		<div class="tabs-header">
			<div class="border"></div>
			<ul>
				<li class="active"><a href="#PDF" tab-id="1" ripple="ripple" ripple-color="#FFF">上传PDF文件</a></li>
				<li><a href="#URL" tab-id="2" ripple="ripple" ripple-color="#FFF">上传URL</a></li>
			</ul>
			<nav class="tabs-nav">
			<i id="prev" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;<&nbsp;</i>
			<i id="next" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;>&nbsp;</i></nav>
		</div>
		<div class="tabs-content">
			<div tab-id="1" class="tab active">
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
							<label for="pnode">请选择文件所属分类：</label><br> <select id="pnode" name="pnode" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-default" value="Upload">确定</button>
				</form>
				<br/><br/><br/>
			</div>
			<div tab-id="2" class="tab">
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
							<label for="pnode">请选择URL所属分类：</label><br> <select id="pnode" name="pnode" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-default" value="UploadURL">确定</button>
				</form>
				<br /><br />
			</div>
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