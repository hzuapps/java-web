<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   	int i=0;
    int k=1;
    int a;
	a=i+k;
   %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<!-- useless -->
	<title>MusicPlayer</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" href="junk/readme.css" type="text/css" media="screen">

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/speakker-big.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		projekktor('.projekktor');
	});
	</script>
    
</head>
<body>

	<div id="wrap">
		<div class="inside">
			<audio class="projekktor speakker dark">
				<source src="js/playlist.js" type="application/json"/>
			</audio>
		</div>
	</div>
	<script type="text/javascript" src="junk/noise.js"></script>
</body>
</html>
