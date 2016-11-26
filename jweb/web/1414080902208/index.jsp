<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
 <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

          <center>Now time is: 
          <%=new java.util.Date()%>
         </center>
 	   	  <form   id="register" action="servlet/Se1414080902208Servlet" method="post">
 	   	  <form   id="register" action="/LabForTwo/servlet/Se1414080902208Servlet" method="post">
  		  	<div class="form-group">
                  <label for="score">Score *</label>
               <input type="text" id="Score" class="form-control" />
           
  			</div>
  			<div class="form-group">
                  <label for="comment">Comment *</label>
               <input type="text" id="Comment" class="form-control"/>
            
              <c:if test="${!empty sessionScope.message}">
               	<c:out value="${sessionScope.message}"></c:out>&nbsp;&nbsp;
              </c:if>
  			</div>
  			<div style = "text-align:right;">
		<button type="button" class="btn btn-default">Confirm</button>
 			<button type="submit" class="btn btn-default">Confirm</button>
  			</div>
  			</form>
  	</div>
  
  </body>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<!-- <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
      <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
      <script type="text/javascript">
        $( ".btn" ).click(function() {
 @@ -42,9 +46,10 @@ ATM Transfer
            type : "post",
            datatype:"html",
            success: function(data){
           alert(data);
          //alert(data);
          }});
        });
      </script>
    -->
  
  </html> 