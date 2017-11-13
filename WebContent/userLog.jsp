<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Logs</title>
</head>
<body>
<div align="center">
	<table border="0" style="margin-top:50px" class="gridtable">
		<tr>
			<th>Operation</th>
			<th>Time</th>
			</tr>
		<s:iterator value="logList" status="stat">
			<tr>
				<td><s:property value="Operation" /></td>
				<td><s:property value="Time"/></td>
			</tr>
		</s:iterator>
	</table>
</div>
<a href="down_list.action">返回我的文件</a>
</body>
</html>