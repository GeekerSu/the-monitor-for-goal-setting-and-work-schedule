
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Sign Up Form</title>
  <link rel="stylesheet" href="css/login-form/8-login-form/css/style.css">
  <style>
  body {
	background: url(img/bgp.jpg) no-repeat;
	background-size:cover;
}
</style>
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>注册</h1>
      <form method="post" action="regist.action">
        <p><s:textfield  name="username" label="用户名"/></p>
        <p><s:password  name="password" label="密码"/></p>
        <p><s:password name="passwordRep" label="确认密码"/></p>
        <p class="submit"><input type="submit" name="commit" id="success" value="注册"></p>
      </form>
    </div>
    <div class="login-help">
      <p>已经有了账号？<a href="login.jsp">点击这里登录</a>。</p>
    </div>
  </section>
</body>
</html>

