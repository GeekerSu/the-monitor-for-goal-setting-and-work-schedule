<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Sign Up Form</title>
  <link rel="stylesheet" href="css/login-form/8-login-form/css/style.css">
  <link href="css/toastr.css" rel="stylesheet" />
  <script src="js/toastr.min.js"></script>
  <script type="text/javascript">
	toastr.options.positionClass = 'toast-top-right';
	//初始化编辑按钮
	$("#success").click(function () {
	  toastr.success("注册成功");
	 });
  </script>
</head>
<body>
  <section class="container">
  <input type="button" name="success" id="success" value="成功"/>
    <div class="login">
      <h1>Sign Up</h1>
      <form method="post" action="regist.action">
        <p><s:textfield  name="username" label="UserName"/></p>
        <p><s:password  name="password" label="Password"/></p>
        <p class="submit"><input type="submit" name="commit" id="success" value="Regist"></p>
      </form>
    </div>
    <div class="login-help">
      <p><a href="login.jsp">Click here to login</a>.</p>
    </div>
  </section>
</body>
</html>
