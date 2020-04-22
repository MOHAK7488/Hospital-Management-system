<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Login Check</title>
</head>
<body>
<%! String id="",pass=""; %>
	<%!PreparedStatement pst=null; %>
	<%!Connection con=null; %>
	<%!ResultSet rs=null; %>
	<%
		id=request.getParameter("pLid");
		pass=request.getParameter("pPass");
	%>
	<% 
	HttpSession s=request.getSession();  
    s.setAttribute("id",id);  
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="select * from patientInfo";
	pst=con.prepareStatement(sql);
	rs=pst.executeQuery();
	while(rs.next()){
		if(id.equals(rs.getString(1)) && pass.equals(rs.getString(2))){
	%>
		<jsp:forward page="patientHome.jsp"/>
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