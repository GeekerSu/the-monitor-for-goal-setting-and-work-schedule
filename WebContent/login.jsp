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
<script type="text/javascript">
         function check(form) {
       		var zmReg=/^[a-zA-Z0-9]*$/;
          if(form.username.value=='') {
                alert("请输入用户帐号!");
                form.username.focus();
                return false;
           }
          if(!zmReg.test(form.username.value)){
        	  alert("用户账号只能由英文字母和数字组成!");
        	  form.username.focus();
        	  return false;
          }
          if(form.username.value.length<6||form.username.value.length>20){
        	  	alert("用户账号长度必须在6~20之间！");
        	  	form.username.focus();
        	  	return false;
          }
       if(form.password.value==''){
                alert("请输入登录密码!");
                form.password.focus();
                return false;
         }
       document.myform.submit();  
}
</script>
</head>
<body>
<%
request.setAttribute("username", request.getParameter("username"));
%>
  <section class="container">
    <div class="login">
      <h1>登录</h1>
      <form method="post" action="login.action">
        <p><label for="username">用户名</label><input type="text" name="username" value="${username }" required="required"/></p>
        <p><label for="password">密码</label><input type="password" name="password"  required="required"/></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            记住密码
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录" onclick="check(this.form)"></p>
      </form>
    </div>
    <div class="login-help">
      <p>你是新手？<a href="register.jsp">点击这里注册账号</a>。</p>
    </div>
  </section>
</body>
</html>
