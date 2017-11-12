<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
	<title>Class Tree</title>

	<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
	<script type="text/javascript" src="js/dtree.js"></script>

</head>

<body>

<h1>Class Tree</h1>

<div class="dtree">

	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>

<script type="text/javascript">
		d= new dTree('d');
		<s:iterator value="list" >
		d.add(<s:property value="ID"/>,
				<s:property value="PID"/>,
				'<s:property value="nodeName"/>',
				'getTree.action');
		</s:iterator>
		document.write(d);
</script>
</div>
<a href="down_list.action">返回文件列表</a>
<br/>
<h3>Create a new Class</h3>
<br/>
<form action="addClassNode">
ClassName:<input type="text" name="newclass" />
<br/>
ParentNode:<input type="text" name="parent" />
<br/>
<input type="submit" value="Create"/>
</form>
</body>

</html>