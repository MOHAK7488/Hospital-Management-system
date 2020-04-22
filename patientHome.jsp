<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<h3>

<%
HttpSession s=request.getSession(false);  
String pat=(String)s.getAttribute("id");
out.println("Hello "+pat);
%>
</h3>
<form action="fixAppointment.jsp">
<input type=submit name=b1 value="Fix_Appointment">
</form>
<br>
<form action=homePage.html>
<input type=submit name=b1 value=LOGOUT>
</form>

</center>

</body>
</html>