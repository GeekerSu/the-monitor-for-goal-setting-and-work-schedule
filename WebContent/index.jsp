<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="utf-8">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
}

body {
	background: url(img/bgp.jpg) no-repeat;
	background-size: cover;
}

.footer {
	color: #777;
	padding: 19px 0;
	background-color: rgba(41, 54, 89, 0.85);
	/*position: absolute;
	bottom: 0;
	*/
	width: 100%;
	height: 150px;
	font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier",
		"Verdana", "Century Gothic";
	margin-top:40px;
}
h1{
font-size:3.0em;
color:#696969;
font-weight: bold
}
/*-- services --*/
.services-grd1 h4 {
	font-size: 1.4em;
	color: #696969;
	margin: 0 0 0.8em;
	
}

.services-grd:nth-child(4) {
	margin: 3em 0;
}

.services-grd1-left span {
	font-size: 2em;
	color: #000000;
}

.services-grd1 p {
	color: #FFFFFF;
	line-height: 1.8em;
	margin: 0;
	font-size: 14px;
}

.services-grd p {
	color: #000000;
	line-height: 1.8em;
	margin: 0;
	font-size: 14px;
	
}

.services-overview {
	margin: 2em 0 0;
}

.services-overview h3 {
	text-align: center;
	font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier",
		"Verdana", "Century Gothic"
}

.services-overview-gd {
	padding: 1.2em;
	background: #f6f6f6;
}

.services-overview-gd h4 {
	line-height: 1.5em;
	text-transform: capitalize;
	font-size: 1.4em;
	color: #000000;
	margin: 0 0 0.8em;
}

.services-overview-gd p {
	color: #999;
	font-size: 14px;
	margin: 0;
	line-height: 1.8em;
}

.services-overview-grids:nth-child(2) {
	margin: 3em 0;
}
/*-- //services --*/
</style>

<title>home</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Macrosoft</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
				<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
			</ul>
		</div>
	</nav>
	<div class="services">
		<div class="container" >
			<div style="margin-left:40px;margin-top:10px">
				<br />
				<h1>文献阅读笔记</h1>
				<br />
				<h4 style="margin-left:180px;font-weight:bold;color:#696969">——为了更好的阅读</h4>
				 <br /> <br />
				<br />
				</div>
			<div class="services-grid" align="center">
				
				<div style="background-color: rgba(255, 255, 255, 0.5); padding-top: 25px; padding-bottom: 25px; padding-right: 50px; padding-left: 50px;border-radius: 10px;">
					<div class="services-grd">
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-book" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>在线阅读PDF文件</h4>
								<p>您可以通过上传文件或者url来阅读您的文献资料，一次上传，终生阅读！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>在线记录笔记</h4>
								<p>您可以对您的文献资料记笔记，我们会将您的笔记保存在您的账户中！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>文献分类</h4>
								<p>您可以手动分类您的文献资料，使您的工作效率大大提升！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="services-grd" style="margin-top: 40px">
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>记录您的工作日志</h4>
								<p>我们将会自动保存您的工作日志，您可以回顾您的历史操作！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>生成阅读时间线</h4>
								<p>在什么时候，以什么方式阅读了什么，都将记录下来！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 services-grd1">
							<div class="col-xs-3 services-grd1-left">
								<span class="glyphicon glyphicon-share" aria-hidden="true"></span>
							</div>
							<div class="col-xs-9 services-grd1-right">
								<h4>下载与分享</h4>
								<p>随时随地，您可以下载与分享您的文献资料！</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<footer id="gtco-footer" role="contentinfo" class="footer">
		<div class="gtco-container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<a href="mailto:suzichao1996@sina.com">联系我们</a> <a href="https://github.com/GeekerSu/Literature-reading-notes-manager" target="blank">项目地址</a> <br>
							<hr style="height: 1px; border: none; border-top: 1px solid #555555;" />
							Powered by: 胡锡鑫 高凯戈 苏子超
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>