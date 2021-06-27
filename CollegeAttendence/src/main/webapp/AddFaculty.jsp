<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
String facultyid=request.getParameter("fid");
String facultyname=request.getParameter("fname");
String facultyemail=request.getParameter("femail");
String facultypassword=request.getParameter("fpassword");
String facultyphone=request.getParameter("fphno");
String facultyaddress=request.getParameter("faddress");
try
{
	Connection con =initializeDatabase();
	PreparedStatement stmt=con.prepareStatement("insert into faculty values(?,?,?,?,?,?)");
	stmt.setString(1,facultyid);
	stmt.setString(2,facultyname);
	stmt.setString(3,facultyemail);
	stmt.setString(4,facultypassword);
	stmt.setString(5,facultyphone);
	stmt.setString(6,facultyaddress);
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