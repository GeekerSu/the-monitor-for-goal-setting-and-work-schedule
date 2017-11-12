<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="kindeditor/themes/default/default.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/toastr.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
<style>
@import url(css/PDFview.css);
</style>
<title>阅读PDF</title>
<!-- 文本编辑器 -->
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			allowFileManager : true,
			allowImageUpload : true,
			uploadJson : 'sources/kindeditor/jsp/upload_json.jsp',
			afterUpload : function() {
				this.sync();
			},
			afterBlur : function() {
				this.sync();
			},
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
</script>
<script type="text/javascript">
	function intensiveRead() {
		$.ajax({
			type : "POST",
			url : "markReadStatus.action",
			data : {
				"id" : eval(document.getElementById('arid')).value
			},
			dataType : "json",
			success : function(data) {
				alert(data.result);
			}
		});
	}
</script>
<script>
	function changeFrameHeight() {
		var ifm = document.getElementById("iframepage");
		ifm.height = document.documentElement.clientHeight;
	}
	window.onresize = function() {
		changeFrameHeight();
	}
</script>
</head>
<body>
<center>
	<div class="container">
		<div class="row">
			<div class="col-md-8" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
				<b>${fileName}</b><br />
				<iframe name="myframe" src="./pdfjs/viewer.html?file=../${filePath}" style="width:100%; height:720px"></iframe>
			</div>

			<div class="col-md-4" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
				<b>阅读笔记</b>
				<div class="row">
					<div class="col-md-4" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444; width:100%; ">
<!-- 						<form action="saveAndLeave" id="note" method="post" > -->
<!-- 							<textarea id="texta" name="content" style="width: 100%; height: 300%; visibility: hidden;"></textarea> -->
<!-- 							<br> -->
<!-- 							<div class="btn-toolbar" role="toolbar" style="text-align: right;"> -->
<!-- 								<input type="button" name="getHtml" value="HTML" />  -->
<!-- 								<input type="button" name="clear" value="清空" />  -->
<!-- 								<input type="reset" name="reset" value="撤销" />  -->
<!-- 								<input type="submit" value="提交并退出"></input> -->
<!-- 							</div> -->
<!-- 						</form> -->
					
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 					<div class="row"> -->
<!-- 					<div class="col-md-4" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444; width:100%;"> -->

						<s:form action="down_submit" >

						<textarea name="note" style="width:100%;height:450px;margin-top:10px;resize:vertical" placeholder="请输入笔记..."><s:property value="note"/></textarea>
						<br/>
						<b>阅读程度</b><br/>
							<s:radio label="ReadState" name="State" list="readState"
								value="defaultReadStateValue" theme="simple"/>
							<input type="hidden" name="fileName" value="${fileName }" />
							<s:submit value="submit" align="right"/>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</center>
</body>
</html>

