<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>ADDSUBJECT</title>
<style>
h1{
color:#000066;
}
</style>
</head>
<body>
<%!
public static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost:3306/"; 
        String dbName = "attendancereport"; 
        String dbUsername = "root"; 
        String dbPassword = ""; 
  
        Class.forName(dbDriver); 
        Connection con = DriverManager.getConnection(dbURL + dbName, 
                                                     dbUsername,  
                                                     dbPassword); 
        return con; 
    } 
%>
<%
try
{
	Connection con =initializeDatabase();
	PreparedStatement stmt=con.prepareStatement("insert into subject values(?,?,?)");
	stmt.setString(1,request.getParameter("subbranch"));
	stmt.setString(2,request.getParameter("subyear"));
	stmt.setString(3,request.getParameter("subjectname"));
	
	int val=stmt.executeUpdate();
	if(val > 0)
	{
		
		out.println("<html>");
		out.println("<body>");
		 out.println("<script> window.location.assign('AdminNavbar.jsp'); </script>");
		out.println("</body>");
		out.println("</html>");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>