<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script src = "http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js">
	</script>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel = "styleSheet"/>
	<link href = "http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" rel = "styleSheet"/>
	<script src = "http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src = "formQCode.js"></script>
	<script src = "dearJson.js"></script>
	<script src = "js/bgimage.js"></script>
	<style>
	</style>
</head>
<body>
	<script>
		window.onload = function(){
			operator("../notesOP?OP=getall","getall");
			bg();
		}
	</script>
	<div class = "main-panel">
		<!-- one note begin -->
		<div class = "panel panel-info odd-label" id = "note_1">
			<input class = "note_id" hidden type = "text"/>
			<div class = "panel-heading cohead_">
				<input type = "text" value = "" placeholder="title" class = "head_input title_"/>
					<button class = "actionButton" onclick = "create_newnote('note_1')">
						<span 
								class = "glyphicon glyphicon-ok-circle icon_padding">
								</span>
					</button>
					<button class = "actionButton" onclick = "clear_newnote('note_1')">
						<span 
								class = "glyphicon glyphicon-remove  icon_padding">
								</span>
					</button>
			</div>
			<div class = "panel-body mybody">
				<textarea class = "body_textarea content_"></textarea>
			</div>
			<div class = "panel-footer">
				<div id = "divQC" class = "qCode">
				</div>
				<input type = "text" value = "" class = "qCode_" id = "inputQC" hidden />
				<script>
					{
						inputQC.value = formQCode();
						divQC.innerText += "QCode : " + inputQC.value;
					}
				</script>
				<div id = "divtime" class = "time">
				</div>
				<input type = "text" value = "" class = "time_" id = "inputtime" hidden/>
				<script>
					{
						var d = (new Date()).toISOString();
						inputtime.value = d.substr(0,d.indexOf('T'));
						divtime.innerText += d.substr(0,d.indexOf('T'));
					}
				</script>
			</div>
		</div>
		<!-- one note end -->
	</div>
</body>
</html>