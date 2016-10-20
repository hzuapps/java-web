<jsp:useBean id="user" class="edu.hzu.javaweb.bean.UserData"
	scope="session" />
<HTML>
<BODY>
	<FORM METHOD=POST ACTION="SaveName.jsp">
		What's your name? <INPUT TYPE=TEXT NAME=username SIZE=20
			VALUE="<%=user.getUsername()%>"><BR> What's your
		e-mail address? <INPUT TYPE=TEXT NAME=email SIZE=20
			VALUE="<%=user.getEmail()%>"><BR> What's your age? <INPUT
			TYPE=TEXT NAME=age SIZE=4 VALUE=<%=user.getAge()%>>
		<P>
			<INPUT TYPE=SUBMIT>
	</FORM>
</BODY>
</HTML>