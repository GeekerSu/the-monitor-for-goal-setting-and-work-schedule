<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css"rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">
<%--tab style --%>
<link rel='stylesheet prefetch' href='css/tabStyle/reset.css'>
<link rel="stylesheet" type="text/css" href="css/tabStyle/default.css">
<link rel="stylesheet" type="text/css" href="css/tabStyle/styles.css">
<%--tab style --%>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style>
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
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
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
}</style>
<title>阅读PDF</title>
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
				<li><a href="FetchClasses.action">上传文件</a></li>
				<li><a href="getTree.action">分类树</a></li>
				<li><a href="userLog.action">用户日志</a>
				<li><a href="readingTimeLine.action">阅读时间线</a>
				<li class="active"><a href="#">阅读笔记</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>
						UserID:<s:property value="#session.username" /><b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">登出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</nav>

	<div class="container">
		<div class="frame">
		<div class="row">
			<div class="col-md-8">
				<b>${fileName}</b><br />
				<iframe name="myframe" src="${URL }" style="width:100%; height:720px"></iframe>
			</div>

			<div class="col-md-4">
				<b>阅读笔记</b>
						<s:form action="down_submit" >
						<textarea name="note"  style="width:100%;height:450px;margin-top:10px;resize:vertical;border-radius:4px;" placeholder="请输入笔记..."><s:property value="note"/></textarea>
						<br/>
						<b>阅读程度</b><br/>
							<s:radio label="ReadState" name="State" list="readState"
								value="defaultReadStateValue" theme="simple"/>
							<input type="hidden" name="fileName" value="${fileName }" />
							<button value="submit" class="btn btn-default" align="right"/>保存笔记</button>
						</s:form>
				<%-- <br/><s:form action="share" target="blank">
						<input type="hidden" name="fileName" value="${fileName }"/>
						<button value="submit" class="btn btn-default" align="right"/>生成标准文档</button>
					</s:form>
					--%>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
