<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Appointment Set/Reset</title>
</head>
<body>
	<%!PreparedStatement pst=null; %>
	<%!Connection con=null; %>
	<%!ResultSet rs=null; %>
	<% String avail= request.getParameter("choice"); %>
	<% 
	HttpSession s=request.getSession(false);  
	String doc=(String)s.getAttribute("id");
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="update doctorInfo set availability='"+avail+"' where login='"+doc+"'";
	pst=con.prepareStatement(sql);
	pst.executeUpdate();%> 
	
<jsp:forward page="docHome.jsp"/>

</body>
</html>