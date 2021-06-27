<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.util.ArrayList "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<style>
input[type=text]{
background-color:#ccccff;
	color:black;
	font-weight:bold;
}
select,input[type=submit]
{
width:50%;
}
</style>
</head>
<body>
<center>
<%
String branch=request.getParameter("fabranch");
session.setAttribute("branch",branch);
String year=request.getParameter("fayear");
session.setAttribute("year",year);
String section=request.getParameter("fasection");
session.setAttribute("section",section);
String facultyId=(String)session.getAttribute("facultyId");
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver);
Connection con = DriverManager.getConnection(dbURL + dbName, 
        dbUsername,  
        dbPassword);
double total=0;
double temp=0;
ArrayList<String> subjects=new ArrayList<String>();
ArrayList<String> students=new ArrayList<String>();
String t="";

PreparedStatement ps=con.prepareStatement("select subname from subject where branch=? and year=?");
ps.setString(1,branch);
ps.setString(2,year);
ResultSet r1=ps.executeQuery();
while(r1.next())
{
	subjects.add(r1.getString("subname"));
}

PreparedStatement ps1=con.prepareStatement("select StudentId from student where Branch=? and Year=? and Sec=?");
ps1.setString(1,branch);
ps1.setString(2,year);
ps1.setString(3,section);
ResultSet r2=ps1.executeQuery();
while(r2.next())
{ 
	students.add(r2.getString("StudentId"));
}
	if(subjects.size()>0 && students.size()>0){
	out.println("<body><center>"+
			"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
			"<form action='AttFinalAdd.jsp' method='post'>");
out.println("<span><a href='FacultyNavbar.jsp' style='padding:0px 0px 0px 10px;float:right;'><strong>&times;</strong></a></span>");
	out.println("<h3>Add Attendance</h3><select name='subjects'>");
	for(int j=0;j<subjects.size();j++)
	{
		out.println("<option value='"+subjects.get(j)+"'>"+subjects.get(j)+"</option>");
	
	}
	out.println("</select>");
	out.println("<table>");
	//ArrayList<Integer> user=new ArrayList<Integer>();
	for(int k=0;k<students.size();k++)
	{ 
		
		out.println("<tr>");
		out.println("<td>");
		out.println("<input type='text' value='"+students.get(k)+"' name='user' readonly>  ");
		out.println("</td>");
		out.println("<td>");
		out.println("<input type='radio' value='P' name='p"+k+"'>p");
		out.println("<input type='radio' value='A' name='p"+k+"'>a");
		out.println("<td></tr>");
		
	}
	out.println("</table>");
	out.println("<input type='submit' name='submit'>");
	
	out.println("</form></center></body>");
	}
	else
	{
		System.out.println("Hi");
		out.println("<h1 align='center'>Empty Data</h1><br><h1 align='center'><a href='FacultyNavbar.jsp'>Back</a></h1>");
	}

%>
</center>
</body>
</html>