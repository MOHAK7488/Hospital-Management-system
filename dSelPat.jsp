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
<%!PreparedStatement pst=null; %>
	<%!Connection con=null; %>
	<%!ResultSet rs=null; %>
	<%!String dr=null; %>
	<%!String spec=null; %>
	<%
HttpSession s=request.getSession(false);  
String pat=(String)s.getAttribute("id");
%>
<%
	String count=request.getParameter("dCount");
	int c=Integer.parseInt(count);
	int t=0;
 
	String sql;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hProject","root","");
	sql="select * from doctorInfo";
	pst=con.prepareStatement(sql);
	rs=pst.executeQuery();
	while(rs.next()){
		t+=1;
		dr=rs.getString(1);
		spec=rs.getString(4);
		if(t==c){
			break;
		}
	}

	String sql1;

	sql1="update patientInfo set aBooked='"+dr+"' where login='"+pat+"'";
	pst=con.prepareStatement(sql1);
	pst.executeUpdate();
	
	out.println("<center>");
	out.println("<h3>Appointment booked:</h3>");
	out.println("<h4>Name="+pat+"</h4>");
	out.println("<h4> Doctor Name="+dr+"</h4>");
	out.println("<h4>Specialization="+spec+"</h4>");
	
	out.println("</center>");
	
	

%>
<center>
<form name=frm action="homePage.html">
<input type=submit name=b value=back_to_home>

</form>




</center>

</body>
</html>