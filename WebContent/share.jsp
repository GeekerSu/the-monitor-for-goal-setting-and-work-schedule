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

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<style>
body {
                margin-bottom: 200px;
                background-color: #0CA3D2
            }
.login {
  position: relative;
  margin: 0 auto;
  padding: 20px 20px 20px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}
.login:before {
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
<title>>您的好友给您分享了一篇文章，快来看看吧！</title>
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
				<li ><a href="#">阅读笔记</a></li>
				<li class="active"><a href="#">分享页</a></li> 
			</ul>
			<ul class="nav navbar-nav navbar-right">
      <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
    </ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<div class="login">
		<div class="row">
			<div class="col-md-12">
				<b>${standardFileName}</b><br />
				<iframe name="myframe" src="${sharePath }" style="width:100%; height:720px"></iframe>
			</div>
			<div>
<div class="bshare-custom icon-medium" align="right"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到朋友网" class="bshare-qqxiaoyou"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a>
<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
</div>
			</div>
		</div>
	</div>

</body>
</html>
