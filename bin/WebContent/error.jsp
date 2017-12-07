<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
	<style>
		.city {
		margin:0 auto;
		height: 300px;
	 	width: 500px;
		
		padding: 50px;			
	} 
		body {background-color: #0CA3D2} 
	</style>
</head>
	<body >
	<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">        
    </div>

	<div class="city" style="text-align:center;">				
		<div class="alert  animated wobble"  style="background-color: rgba(255,255,255,	 0.60);">
			<a href="#" class="close" data-dismiss="alert" ></a>
			 <span id="show"></span> 
			 <h4><strong>错误：<s:property value="message"/></strong></h4>
			<a onclick ="javascript:history.go(-1);"><font color=blue >点击这里</font></a>返回上一页面。<br>
		</div>
</div>
</body>
</html>