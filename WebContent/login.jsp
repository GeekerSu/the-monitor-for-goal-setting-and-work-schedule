<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.action" method="post">
		<table align="center">
			<caption>
				<h2>用户登录</h2>
			</caption>
			<tr>
				<td>用户名：<input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>密码： <input type="text" name="password" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>