<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>    
<title>在线预览PDF文档</title>    
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
      <h2>预览pdf文件</h2>  
   </div>  
   <div class="panel-body">  
      <a class="media" href="${filePath }"></a>    
   </div> 
   </div> 
</center>  
</body>  
</html>  