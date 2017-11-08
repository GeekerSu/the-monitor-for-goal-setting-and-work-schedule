<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>    
<title>PDFviewer</title>    

</head>  
<body>  
 <div class="panel panel-primary">  
   <div class="panel-heading" align="center">  
      <h2>${fileName}</h2>
   </div> 
   <div id="PDF_area"  class="panel-body" style="position:relative;left:20px;top:10px;width:50%;height:80%">
		<iframe name="myframe" src="http://localhost:8080/ReadingNotes/viewer.html?file=${filePath}" width="886" height="990"></iframe>
	</div>
   </div>  
<a href="fileUpload.jsp">上传文件</a>
<a href="down_list.action">下载文件</a>
</body>  
</html>  