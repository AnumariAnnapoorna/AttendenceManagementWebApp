<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<%
String facultyid=request.getParameter("facultyId");
String password=request.getParameter("pwd");
String cPassword=request.getParameter("repwd");
if(password.equals(cPassword))
{
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "attendancereport"; 
	String dbUsername = "root"; 
	String dbPassword = ""; 
	Class.forName(dbDriver);
	try{
	Connection con = DriverManager.getConnection(dbURL + dbName, 
	        dbUsername,  
	        dbPassword);
	PreparedStatement ps=con.prepareStatement("update faculty set Password=? where FacultyId=?");
	ps.setString(1,password);
	ps.setString(2,facultyid);
	int i=ps.executeUpdate();
	if(i>0){
		response.sendRedirect("Login.jsp");
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}

}
else
{
	session.setAttribute("err","both password fields should be same");
}
%>
</body>
</html>