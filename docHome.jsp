<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Homepage</title>
</head>
<body>
<center>
<h3>
<%
HttpSession s=request.getSession(false);  
String doc=(String)s.getAttribute("id");
out.println("Hello "+doc);
%>
</h3>

<h4>Are you available today for Appointments?</h4>
<form class="radio" action=dApp.jsp>
<h4><input type="radio" name="choice" value="Y">Yes</h4>
<h4><input type="radio" name="choice" value="N">NO</h4>
<input type=submit name=b value=ENTER>
</form>
<br>
<form action=homePage.html>
<input type=submit name=b1 value=LOGOUT>
</form>

</center>
</body>
</html>