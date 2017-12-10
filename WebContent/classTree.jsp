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

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.7/js/jasny-bootstrap.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.7/css/jasny-bootstrap.css">
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<%--tab style --%>
<link rel='stylesheet prefetch' href='css/tabStyle/reset.css'>
<link rel="stylesheet" type="text/css" href="css/tabStyle/default.css">
<link rel="stylesheet" type="text/css" href="css/tabStyle/styles.css">
<%--tab style --%>
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
				<!-- 				<li> -->
				<!-- 					<a href="home.jsp">首页</a> -->
				<!-- 				</li> -->
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
						<li><a href="index.jsp">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>

	<div class="tabs" style="width:1200px;margin-top:40px">
		<div class="tabs-header">
			<div class="border"></div>
			<ul>
				<li class="active"><a href="#NEW" tab-id="1" ripple="ripple" ripple-color="#FFF">新建分类</a></li>
				<li><a href="#CHANGE" tab-id="2" ripple="ripple" ripple-color="#FFF">更改论文所在分类</a></li>
				<li><a href="#DELETE" tab-id="3" ripple="ripple" ripple-color="#FFF">删除分类</a></li>
				<li><a href="#DOWNMULTI" tab-id="4" ripple="ripple" ripple-color="#FFF">批量下载</a></li>
			</ul>
			<nav class="tabs-nav">
			<i id="prev" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;<&nbsp;</i>
			<i id="next" ripple="ripple" ripple-color="#FFF" class="material-icons">&nbsp;>&nbsp;</i></nav>
		</div>
		<div class="tabs-content">
			<div tab-id="1" class="tab active">

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
						<form action="addClassNode" class="form-horizontal" role="form">
							<h4>新建类</h4>
							<label for="bookName">新类名：</label>
							<div class="form-group">
								<div class="col-md-6">
									<input type="text" class="form-control" name="newclass" required />
								</div>
							</div>
							<label for="parent">请选择父结点：</label> 
							<div class="form-group">
								<div class="col-md-6">
							<select id="parent" name="parent" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
						</form>
						<br/>
					</div>
				</div>
				<br />
			</div>
			<div tab-id="2" class="tab">
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
<!-- 									<input type="text" class="form-control" name="bookName" /> -->
									<select id="parent" name="bookName" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${allList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
								</div>
							</div>
							<label for="bookName">选择父结点：</label>
							<div class="form-group">
								<div class="col-md-6">
<!-- 									<input type="text" class="form-control" name="parentb" /> -->
								<select id="parentb" name="parentb" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
							<br/>
						</form>
					</div>
				</div>
				<br/>
			</div>

			<div tab-id="3" class="tab">

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
							<label for="nodeToDelete">类名称：</label>
							<div class="form-group">
								<div class="col-md-6">
<!-- 									<input type="text" class="form-control" name="nodeToDelete" /> -->
									<select id="nodeToDelete" name="nodeToDelete" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
								</div>
							</div>
							<button type="submit" class="btn btn-default" />
							删除
							</button>
							<br/>
						</form>
					</div>
				</div>
				<br/>
			</div>
			<div tab-id="4" class="tab">
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
<!-- 									<input type="text" class="form-control" name="classNodeName" /> -->
									<select id="classNodeName" name="classNodeName" class="selectpicker show-menu-arrow form-control">
								<c:forEach items="${nodeList}" var="node">
									<option value="${node }">${node }</option>
								</c:forEach>
							</select>
								</div>
							</div>
							<button type="submit" value="Create" class="btn btn-default" />
							确定
							</button>
							<br/>
						</form>
					</div>
				</div>
				<br/>
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