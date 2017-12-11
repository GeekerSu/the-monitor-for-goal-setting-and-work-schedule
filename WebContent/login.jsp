<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="css/login-form/8-login-form/css/style.css">
  <style>
  body {
	background: url(img/bgp.jpg) no-repeat;
	background-size:cover;
}</style>
</head>
<body>
<%
request.setAttribute("username", request.getParameter("username"));
%>
  <section class="container">
    <div class="login">
      <h1>登录</h1>
      <form method="post" action="login.action">
        <p><s:textfield name="username" label="用户名" value="%{#request.username}" required="required"/></p>
        <p><s:password name="password" label="密码" required="required"/></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            记住密码
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录"></p>
      </form>
    </div>
    <div class="login-help">
      <p>你是新手？<a href="register.jsp">点击这里注册账号</a>。</p>
    </div>
  </section>
</body>
</html>
