<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login Checker</title>
</head>
<body>
	<%! String id="",pass=""; %>
	<%!PreparedStatement pst=null; %>
	<%!Connection con=null; %>
	<%!ResultSet rs=null; %>
	<%
		id=request.getParameter("dLid");
		pass=request.getParameter("dPass");
	%>
	<% 
	HttpSession s=request.getSession();  
    s.setAttribute("id",id);  
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="select * from doctorInfo";
	pst=con.prepareStatement(sql);
	rs=pst.executeQuery();
	while(rs.next()){
		if(id.equals(rs.getString(1)) && pass.equals(rs.getString(2))){
	%>
		<jsp:forward page="docHome.jsp"/>
	<%
	break;
	}
	%>
	
	
	<%
	
	
	}
	%>
	<jsp:forward page="errorHome.html"/>

</body>
</html>