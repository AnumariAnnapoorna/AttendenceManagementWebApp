<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,java.util.Date,java.text.DecimalFormat"%>
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
th,td{
text-align:center;
color:#000066;
padding:5px;
}
</style>
</head>
<body>
<h1 align="center"><a href="StudentNavbar.jsp">Back</a></h1>
<%
Date date=new Date();
String datestring=date.toString().replace(" ","");
String datestring1=datestring.replace(":","-");
String studentid=(String)session.getAttribute("studentid");
String startdate=(String)session.getAttribute("startdate");
String enddate=(String)session.getAttribute("enddate");
String subject=request.getParameter("subjects");
session.setAttribute("subject",subject);
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver);
Connection con = DriverManager.getConnection(dbURL + dbName, 
        dbUsername,  
        dbPassword);
try {
	out.println("<body><center>"+
			"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
			"<table border='1'>");
	out.println("<caption>"+studentid+"<caption>");
	out.println("<tr><th>RollNo</th><th>Subject</th><th>ClassesAttended</th><th>TotalClassesTaken</th><th>AttendancePercentage</th></tr>");

    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Subject=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,subject);
    	st2.setString(2,studentid);
    	st2.setString(3,"P");
    	st2.setString(4,startdate);
    	st2.setString(5,enddate);
    	ResultSet rs1=st2.executeQuery();
     double temp=0,total=0;
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	}
    	PreparedStatement st3=con.prepareStatement("select count(*) from facultydailyactivity where Subject=? and (Date BETWEEN ? and ?)");
    	st3.setString(1,subject);
    	st3.setString(2,startdate);
    	st3.setString(3,enddate);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    		//out.println("<h4>Total no of Days : "+total+"</h4>");
    	}

		//out.println("<h4>Average Percentage : "+(temp/total)*100+"</h4>");
		DecimalFormat df=new DecimalFormat(".##");
		double percentage=(temp/total)*100;
		out.println("<tr><td>"+studentid+"</td><td>"+subject+"</td><td>"+(int)temp+"</td><td>"+(int)total+"</td><td>"+df.format(percentage)+"</td></tr>");
	
		 
    out.println("<tr><td colspan='5'><form method='post' action='ExcelGenerate.jsp?subject="+subject+"'>");
    out.println("<input type='submit' value='GenerateExcel' style='background-color:#0000CC;color:white;margin: 8px 140px;padding:10px 20px;'></form></td></tr>");
    out.println("</table></center></body>");
    
   
} 
catch (Exception e) { 
    e.printStackTrace(); 
}

%>
</body>
</html>