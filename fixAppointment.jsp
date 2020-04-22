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
<center>
<h3>List of available Doctors:</h3>
<%
HttpSession s=request.getSession(false);  
String pat=(String)s.getAttribute("id");
%>

<%!PreparedStatement pst=null; %>
<%!Connection con=null; %>
<%!ResultSet rs=null; %>

	<% 
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="select * from doctorInfo";
	pst=con.prepareStatement(sql);
	rs=pst.executeQuery();
	int count=1;
	out.println("Doctor&nbsp&nbspSpeciality<br><br>");
	while(rs.next()){
		if("Y".equals(rs.getString(3))){
		out.println(count+"."+rs.getString(1)+"&nbsp&nbsp"+rs.getString(4)+"<br>");
		count+=1;
		}

	}
	%>
<form name=frm method=GET action="dSelPat.jsp">
<h3>Enter Dr. No.:<input type=text name="dCount" size=30></h3>
<input type=submit name=b1 value=Submit>

</form>






</center>

</body>
</html>