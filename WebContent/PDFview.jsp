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
    <script src="js/jquery.sidr.js"></script>
  	<style>
		.city {
			margin: 5px;
			padding: 20px;
			width:100%;		
			background-color: #F9F9F9;
		} 
		.city1 {
			float: left;
			margin: 5px;
			padding: 5px;
			width:70%;
			border: 1px;		

		} 
		.editor{
			width:100%;
			height: 100%;	
		} 
	</style>
	<title>阅读PDF</title>
	<!-- 文本编辑器 -->
	<script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
				allowFileManager : true,
			 	allowImageUpload:true,
			 	uploadJson:'sources/kindeditor/jsp/upload_json.jsp',
			 	afterUpload: function(){this.sync();},
			 	afterBlur: function(){this.sync();}, 
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});	
			K('input[name=getHtml]').click(function(e) {
				alert(editor.html());
			});
			K('input[name=clear]').click(function(e) {
				editor.html('');
			});
		});	
	</script>	
	<script>
		$(document).ready(function() {
   			 $('#right-menu').sidr({
		      	name: 'sidr-right',
		      	side: 'right',
		      	source: ' #sidr'
		    });
		});
	</script>
	<script type="text/javascript">
		function intensiveRead() {    
			$.ajax({
				type: "POST",
				url: "markReadStatus.action",
				data: {"id": eval(document.getElementById('arid')).value},
				dataType: "json",
				success: function(data) {
					alert(data.result);	
				}
			});
		}
    </script>
    <script type="text/javascript">
        function generate_pdf() {
            $.ajax({
                type: "POST",
                url: "generatePDF.action",
                data: {"articleID": eval(document.getElementById('arid')).value},
                dataType: "json",
                success: function(data) {
                	document.getElementById('generate_pdf').setAttribute('src', data.pdfURL);
                	toastr.success("生成成功");
                }
            });
        }
    </script>
    <script>
        function changeFrameHeight() {
            var ifm = document.getElementById("iframepage"); 
            ifm.height = document.documentElement.clientHeight * 0.8;
        }
        window.onresize = function() {  
        	changeFrameHeight();  
        } 
	</script>
</head>
<body>
	<table style="width:100%;">
	<tr>
	<td colspan="2" style="background-color:#FFA500;">
	<h1>${fileName}</h1>
	</td>
	</tr>
	<tr>
	<td style="background-color:#FFD700;width:70%;height:990px;vertical-align:top;">
	<b>原文</b><br/>
		<iframe name="myframe" src="./pdfjs/viewer.html?file=../${filePath}" style="width:100%;height:95%"></iframe>			
	</td>
	<td style="background-color:#eeeeee;height:990px;width:30%;vertical-align:top;">
				<b>笔记录入</b><br/>
				<hr>				  			   
						<form action="saveAndLeave" id="note" method="post">
							<!-- 标题栏 -->
							<div class="form-group">
								<input type="text" name="notename" value="我的笔记" class="pull-right" placeholder="输入评论标题" style="width: 100%;" />
							</div>
							<br><br>
							<!-- 文本区域 -->
							<textarea id="texta" name="content" style="width: 100%; height: 300%; visibility: hidden;"></textarea>
							<br>
							<!-- 右下角按钮 -->
							<div class="btn-toolbar" role="toolbar" style="text-align: right;">
								<input type="button" name="getHtml" value="HTML" />
								<input type="button" name="clear" value="清空" />
								<input type="reset" name="reset" value="撤销" />
								<input type="submit" value="提交并退出"></input>
							</div>		
						</form>
	</td>
	</tr>
	<tr>	
	<td colspan="2" style="background-color:#FFA500;">
	<!--  
	<a href="fileUpload.jsp">上传文件</a> <a href="down_list.action">下载文件</a></td> -->
	</tr>
	</table>	
</body>
</html>
