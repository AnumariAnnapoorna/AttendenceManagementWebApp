<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.DecimalFormat,java.io.*,java.util.ArrayList "%>
    <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
h1,th,td{
text-align:center;
color:#000066;
padding:5px;
}
</style>
</style>
</head>
<body>
<h1 align="center"><a href="StudentNavbar.jsp">Back</a></h1>
<%
String startdate=request.getParameter("startdate");
String enddate=request.getParameter("enddate");
String option=request.getParameter("additional");
session.setAttribute("startdate",startdate);
session.setAttribute("enddate",enddate);
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
String t="";
String studentid=(String)session.getAttribute("studentid");

PreparedStatement ps=con.prepareStatement("select distinct Subject from attendence where StudentId=? and (Date BETWEEN ? and ?)");
ps.setString(1,studentid);
ps.setString(2,startdate);
ps.setString(3,enddate);
ResultSet r1=ps.executeQuery();
if(r1.next()){

if(option.equals("subjectWise")){
	PreparedStatement st1=con.prepareStatement("select distinct Subject from attendence where StudentId=? and (Date BETWEEN ? and ?)");
	st1.setString(1,studentid);
	st1.setString(2,startdate);
	st1.setString(3,enddate);
	ResultSet r=st1.executeQuery();
	while(r.next())
	{
		subjects.add(r.getString("Subject"));
	}
	if(subjects.size()>0){
	out.println("<body><center>"+
			"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
			"<form action='SubjectWiseStudentDetails.jsp'>");
	out.println("<h3>Select Subject</h3>");
	for(int j=0;j<subjects.size();j++)
	{
		out.println("<input type='radio' name='subjects' value='"+subjects.get(j)+"'>"+subjects.get(j)+"</br>");
		
	}		
	out.println("<input type='submit' name='submit'>");
	out.println("</form></center></body>");
	}
	
}
else if(option.equals("overall")){
try {
	PreparedStatement st1=con.prepareStatement("select distinct Subject from attendence where StudentId=?");
	st1.setString(1,studentid);
	ResultSet rs=st1.executeQuery();
	out.println("<body><center>"+
			"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
			"<table border='1'>");
	out.println("<caption>"+studentid+"<caption>");
	out.println("<tr><th>RollNo</th><th>Subject</th><th>ClassesAttended</th><th>TotalClassesTaken</th><th>AttendancePercentage</th></tr>");
	
    while(rs.next())
    {
    	String subject=rs.getString(1);
    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Subject=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,subject);
    	st2.setString(2,studentid);
    	st2.setString(3,"P");
    	st2.setString(4,startdate);
    	st2.setString(5,enddate);
    	ResultSet rs1=st2.executeQuery();
    	
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	//out.println("<h4>StudentId : "+rs.getString(1)+"</h4><h4>No.of Days present : "+rs1.getString(1)+"</h4>");
    	}
    	PreparedStatement st3=con.prepareStatement("select count(*) from facultydailyactivity where Subject=?  and (Date BETWEEN ? and ?)");
    	st3.setString(1,subject);
    
    	st3.setString(2,startdate);
    	st3.setString(3,enddate);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    		//out.println("<h4>Total no of Days : "+total+"</h4>");
    	}
    	DecimalFormat df=new DecimalFormat(".##");
    	double percentage=(temp/total)*100;
    	out.println("<tr><td>"+studentid+"</td><td>"+subject+"</td><td>"+(int)temp+"</td><td>"+(int)total+"</td><td>"+df.format(percentage)+"</td></tr>");		   
    }
    
    out.println("<tr><td colspan='5'><form method='post' action='ExcelGenerateForAll.jsp'>");
    out.println("<input type='submit' value='GenerateExcel' style='background-color:#0000CC;color:white;margin: 8px 140px;padding:10px 20px;'></form></td></tr>");
    out.println("</table></center></body>");
    st1.close(); 
    
} 
catch (Exception e) { 
    e.printStackTrace(); 
}
}
}
else{
	out.println("<body><center><h1>No classes on this date</h1>"
			+"<a href='StudentDashboard.jsp'><b>click here to go back</b></a></center></body>");
}
%>
</body>
</html>