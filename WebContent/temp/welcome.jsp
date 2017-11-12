<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div>
	登录成功！
	<a href="logout.action">Logout</a>
	<br /> user:
	<s:property value="#session.username" />
	<br />
</div>	
	<a href="fileUpload.jsp">上传文件</a>
	<a href="down_list.action">我的文件</a>
<<<<<<< HEAD:WebContent/temp/welcome.jsp
</div>
=======
>>>>>>> GKG:WebContent/welcome.jsp
</body>
</html>