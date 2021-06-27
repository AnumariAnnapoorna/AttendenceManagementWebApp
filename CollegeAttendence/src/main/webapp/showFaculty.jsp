<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.text.DecimalFormat "%>
    <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<style>
h1,th,td{
text-align:center;
color:#000066;
padding:5px;
}
</style>
</head>
<body>
<h1 align="center"><a href="FacultyDashboard.jsp">Back</a></h1>
<%
String section=(String)session.getAttribute("section");
String branch=(String)session.getAttribute("branch");
String year=(String)session.getAttribute("year");

String startdate=request.getParameter("startdate");
session.setAttribute("startdate",startdate);
String enddate=request.getParameter("enddate");
session.setAttribute("enddate",enddate);
String subject=request.getParameter("subjects");
session.setAttribute("subject",subject);
String facultyid=(String)session.getAttribute("facultyid");
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver); 
double total=0;
double temp=0;

try {
	
	Connection con = DriverManager.getConnection(dbURL + dbName, 
            dbUsername,  
            dbPassword);
	PreparedStatement ps=con.prepareStatement("select distinct StudentId from attendence where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?)");
	ps.setString(1,branch);
	ps.setString(2,year);
	ps.setString(3,section);
	ps.setString(4,startdate);
	ps.setString(5,enddate);
	ResultSet r=ps.executeQuery();
	if(r.next()){
	PreparedStatement st1=con.prepareStatement("select distinct StudentId from attendence where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?)");
	st1.setString(1,branch);
	st1.setString(2,year);
	st1.setString(3,section);
	st1.setString(4,startdate);
	st1.setString(5,enddate);
	ResultSet rs=st1.executeQuery();
	out.println("<body><center>"+
			"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
			"<table border='1'>");
	out.println("<caption>"+subject+"->"+year+"->"+branch+"->"+section+"<caption>");
	out.println("<tr><th>RollNo</th><th>Subject</th><th>ClassesAttended</th><th>TotalClassesTaken</th><th>AttendancePercentage</th></tr>");
    while(rs.next())
    {
    	String studentId=rs.getString(1);
    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Branch=? and Year=? and Subject=? and FacultyId=? and Section=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,branch);
    	st2.setString(2,year);
    	st2.setString(3,subject);
    	st2.setString(4,facultyid);
    	st2.setString(5,section);
    	st2.setString(6,studentId);
    	st2.setString(7,"P");
    	st2.setString(8,startdate);
    	st2.setString(9,enddate);
    	ResultSet rs1=st2.executeQuery();
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	}
    	PreparedStatement st3=con.prepareStatement("select count(facultyid) from facultydailyactivity where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?) and subject=? and FacultyId=?");
    	st3.setString(1,branch);
    	st3.setString(2,year);
    	st3.setString(3,section);
    	st3.setString(4,startdate);
    	st3.setString(5,enddate);
    	st3.setString(6,subject);
    	st3.setString(7,facultyid);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    	}
    	DecimalFormat df=new DecimalFormat(".##");
    	double percentage=(temp/total)*100;
		out.println("<tr><td>"+studentId+"</td><td>"+subject+"</td><td>"+(int)temp+"</td><td>"+(int)total+"</td><td>"+df.format(percentage)+"</td></tr>");
	}	
    
    out.println("<tr><td colspan='5'><form method='post' action='ExcelForFaculty.jsp'>");
    out.println("<input type='submit' value='GenerateExcel' style='background-color:#0000CC;color:white;margin: 8px 140px;padding:10px 20px;'></form></td></tr>");
    out.println("</table></center></body>");
	}
	else
	{
		out.println("<body><center><h1>No classes on this date</h1>"
				+"<a href='FacultyDashboard.jsp'><b>click here to go back</b></a></center></body>");
	
	}
	}
catch (Exception e) { 
    e.printStackTrace(); 
}
%>
</body>
</html>