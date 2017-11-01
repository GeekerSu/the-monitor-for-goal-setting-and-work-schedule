<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="regist.action" method="post">
			<table>
				<caption>
					<h2>用户注册</h2>
				</caption>
				<tr>
					<td>username:</td>
					<td><s:textfield  name="username" /></td>
				</tr>
				<tr>
					<td>password:</td>
					<td><s:textfield  name="password" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>