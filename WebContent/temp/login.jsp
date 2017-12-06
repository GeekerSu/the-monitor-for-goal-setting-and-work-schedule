<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"> 
		<style type="text/css">
			@import url(css/formStyle.css);
    	</style>
<title>Login</title>
</head>
<body>
	<form action="login.action" method="post">
		<table align="center">
			<caption>
					<h2>用户注册</h2>
			</caption>
			<tr>
				<td><s:textfield name="username" label="UserName"/></td>
			</tr>
			<tr>
				<td><s:password name="password" label="Password"/></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="Login"/></td>
				<td >
				没有账号？<a href="register.jsp">注册一个</a>
			</td>
			</tr>
		</table>
	</form>
</body>
<s:property value="message"/></strong>
</html>