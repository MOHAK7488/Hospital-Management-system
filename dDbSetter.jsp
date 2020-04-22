<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String id="",pass="",spec=""; %>
	<%!PreparedStatement pst=null; %>
	<%!Connection con=null; %>
	<%!ResultSet rs=null; %>
	<%
		id=request.getParameter("dLid");
		pass=request.getParameter("dPass");
		spec=request.getParameter("dSpec");
	%>
	<% 
	HttpSession s=request.getSession();  
    s.setAttribute("id",id);  
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="insert into doctorInfo values('"+id+"','"+pass+"','Y','"+spec+"')";
	pst=con.prepareStatement(sql);
	pst.execute();
	out.println("<center>Account Created Successfully</center>");
	out.println("<center><form method=GET action=\"doctorLogin.html\"><input type=submit name=b value=Login></form></center>");
%>

</body>
</html>