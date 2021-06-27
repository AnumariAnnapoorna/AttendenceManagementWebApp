<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
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
	PreparedStatement pst=con.prepareStatement("select StudentId from student where StudentId=?");
	pst.setString(1,request.getParameter("sid"));
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		out.println("<body><center><h1>Student with id "+request.getParameter("sid")+" already exists</h1></center></body>");
	}
	else{
	PreparedStatement stmt=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?)");
	stmt.setString(1,request.getParameter("sid"));
	stmt.setString(2,request.getParameter("sname"));
	stmt.setString(3,request.getParameter("semail"));
	stmt.setString(4,request.getParameter("spsw"));
	stmt.setString(5,request.getParameter("sphno"));
	stmt.setString(6,request.getParameter("sbranch"));
	stmt.setString(7,request.getParameter("syear"));
	stmt.setString(8,request.getParameter("ssection"));
	stmt.setString(9,request.getParameter("saddress"));
	int val=stmt.executeUpdate();
	if(val > 0)
	{
		
		out.println("<html>");
		out.println("<body>");
		 out.println("<script> window.location.assign('AdminNavbar.jsp'); </script>");
		out.println("</body>");
		out.println("</html>");
	}}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>