<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>    
<title>阅读文档</title>    
<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">    
<script type="text/javascript" src="js/jquery.min.js"></script>    
<script type="text/javascript" src="js/jquery.media.js"></script>    
<script type="text/javascript">    
    $(function() {    
        $('a.media').media({width:800, height:600});    
    });    
</script>   
</head>  
<body>  
<center>  
 <div class="panel panel-primary">  
   <div class="panel-heading" align="center">  
      <h2>${fileName}</h2>
   </div>  
   <div class="panel-body">  
      <a class="media" href="${filePath }"></a>    
   </div> 
   </div> 
</center>
<a href="fileUpload.jsp">上传文件</a>
<a href="down_list.action">我的文件</a>
<s:form action="down_submit">
<s:radio label="ReadState" name="State" list="readState" value="defaultReadStateValue" />
<input type="hidden" name="fileName" value="${fileName }"/>
<s:submit value="submit" />
</s:form>
</body>  
</html>  