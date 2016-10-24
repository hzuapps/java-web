<jsp:useBean id="user" class="edu.hzu.javaweb.bean.UserData"
	scope="session" />
<HTML>
<BODY>
You entered<BR>
Name: <%= user.getUsername() %><BR>
Email: <%= user.getEmail() %><BR>
Age: <%= user.getAge() %><BR>
</BODY>
</HTML>