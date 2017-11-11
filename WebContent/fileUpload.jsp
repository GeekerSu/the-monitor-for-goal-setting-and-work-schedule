<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<label for="myFile">Upload your file</label>
		<br/>
		<input type="file" name="myFile"/>
		<input type="submit" value="Upload"/>
	</form>
	<br/>
	<form action="uploadURL" method="post" >
		<label >上传URL</label>
		<br/>
		BookName:<input type="text" name="bookName" />
		<br/>
		BookURL:<input type="text" name="bookURL" />
		<br/>
		<input type="submit" value="UploadURL"/>
	</form>
	<p>
	<a href="down_list.action">我的文件</a>
	</p>
</body>
</html>