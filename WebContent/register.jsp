
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
       if(form.password.value.length<6||form.username.value.length>20){
    	   		alert("密码长度必须在6~20之间！");
    	   		form.password.focus();
    	   		return false;
       }
       if(form.passwordRep.value==''){
    	   		alert("请输入确认密码！");
    	   		form.passwordRep.focus();
    	   		return false;
       }
       if(form.passwordRep.value!=form.password.value){
    	        alert("两次密码不一致！");
    	        form.passwordRep.focus();
    	        return false;
       }
       else{
          document.myform.submit();
       }
}
</script>
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>注册</h1>
      <form method="post" action="regist.action">
        <p><label for="username">用户名</label><input type="text"  name="username" required="required" placeholder="6-20位字母或数字"/></p>
        <p><label for="password">密码</label><input type="password"  name="password" required="required" placeholder="长度6位以上密码"/></p>
        <p><label for="passwordRep">确认密码</label><input type="password" name="passwordRep" required="required" placeholder="确认密码"/></p>
        <p class="submit"><input type="submit" id="success" value="注册" onclick="check(this.form)"></p>
      </form>
    </div>
    <div class="login-help">
      <p>已经有了账号？<a href="login.jsp">点击这里登录</a>。</p>
    </div>
  </section>
</body>
</html>

