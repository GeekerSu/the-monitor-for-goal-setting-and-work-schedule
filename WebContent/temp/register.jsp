<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
	<center>
		<form action="regist.action" method="post" >
			<table>
				<caption>
					<h2>用户注册</h2>
				</caption>
				<tr>
					<td><s:textfield  name="username" label="UserName"/></td>
				</tr>
				<tr>
					<td><s:password  name="password" label="Password"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Regist" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>