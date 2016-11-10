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
	<style>
		.main-panel {
			position : absolute;
			width : 90%;
			padding : 10px;
		}
		.odd-label {
			width : 31%;
			padding : 1%;
			float : left;
			margin : 1%;
		}
		@media only screen 
		and (min-width : 0px)
		and (max-width : 600px)
		{
			.main-panel {
				width : 90%;
				margin : 10px;
			}
			.odd-label {
				width : 80%;
				padding : 0 1% 1% 1%;
				float : left;
				margin : 0 9% 3% 9%;
			}
		}
		@media only screen 
		and (min-width : 600px)
		and (max-width : 800px)
		{
			.main-panel {
				width : 94%;
				margin : 3px;
			}
			.odd-label {
				width : 43%;
				padding : 0 1% 1% 1%;
				float : left;
				margin : 0 2% 1% 2%;
			}
		}
	</style>
</head>
<body>
	<c:if test = "${labels != null}">
		<div class = "main-panel">
			<c:forEach var = "t" items = "${labels}">
				<div class = "panel panel-info odd-label">
					<div class = "panel-heading">
						<c:out value = "${t.getTitle()}"></c:out>
					</div>
					<div class = "panel-body">
						<c:out value = "${t.getContent()}"></c:out>
					</div>
					<div class = "panel-footer">
						<div style = "width : auto;float : left;">
							<c:out value = "QuickCode : ${t.getQuickCode()}"></c:out>
						</div>
						<div style = "text-align : right;">
							<c:out value = "${t.getTime()}"></c:out>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</body>
</html>