<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>File Upload Success</title>
</head>
<body>
You have successfully uploaded <s:property value="myFileFileName"/>
<p>
file: <s:property value="myFileFileName"/><br/>  
contentType: <s:property value="myFileContentType"/> 
</p>
<a href="fileUpload.jsp">继续上传</a>
<a href="down_list.action">我的文件</a>
</body>
</html>