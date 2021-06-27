<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.text.DecimalFormat "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>

<style>
th,td,b{
text-align:center;
color:#000066;
padding:5px;
}
</style>
</head>
<body>

<%
String val=(String)request.getParameter("cnt");
if(session.getAttribute("branch")==null || val.equals("'one'") ){
session.setAttribute("branch",request.getParameter("branch"));
session.setAttribute("year",request.getParameter("year"));
session.setAttribute("section",request.getParameter("section"));
session.setAttribute("startdate",request.getParameter("startdate"));
session.setAttribute("enddate",request.getParameter("enddate"));
}
if(val.equals("'one'") || val.equals("'zero'")){
	
	out.println("<h3 align='center'><a href='AdminNavbar.jsp'><b>Back</b></a></h3>");

String branch=(String)session.getAttribute("branch");
String year=(String)session.getAttribute("year");
String section=(String)session.getAttribute("section");
String startdate=(String)session.getAttribute("startdate");
String enddate=(String)session.getAttribute("enddate");
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver); 
double total=0;
double temp=0;
DecimalFormat df=new DecimalFormat(".##");
try {
	
	Connection con = DriverManager.getConnection(dbURL + dbName, 
            dbUsername,  
            dbPassword);
	PreparedStatement p=con.prepareStatement("select distinct Subject from attendence where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?)");
	p.setString(1,branch);
	p.setString(2,year);
	p.setString(3,section);
	p.setString(4,startdate);
	p.setString(5,enddate);
	ResultSet result=p.executeQuery();
	while(result.next())
	{
		String s=result.getString(1);
		PreparedStatement p1=con.prepareStatement("select distinct StudentId from attendence where Branch=?  and Year=? and Section=? and (Date BETWEEN ? and ?)");
		p1.setString(1,branch);
		//p1.setString(2,s);
		p1.setString(2,year);
		p1.setString(3,section);
		p1.setString(4,startdate);
		p1.setString(5,enddate);
		ResultSet result1=p1.executeQuery();
		out.println("<body><center>"+
				"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
				"<table border='1'>");
				out.println("<caption><b>"+year+"_"+branch+"_"+section+"_"+s+"</b><caption>");
				out.println("<tr><th>Name</th><th>Classes Attended</th><th>TotalClassesTaken</th><th>Attendance Percentage</th></tr>");
				
		while(result1.next()){
			String studentId=result1.getString(1);
	    	PreparedStatement p2=con.prepareStatement("select count(*) from attendence where Branch=? and Year=? and Section=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?) and Subject=?");
	    	p2.setString(1,branch);
	    	p2.setString(2,year);
	    	p2.setString(3,section);
	    	p2.setString(4,studentId);
	    	p2.setString(5,"P");
	    	p2.setString(6,startdate);
	    	p2.setString(7,enddate);
	    	p2.setString(8,s);
	    	ResultSet result2=p2.executeQuery();
	    	
	    	while(result2.next())
	    	{
	    		temp=(double)result2.getInt(1);
	    	}
	    	PreparedStatement p3=con.prepareStatement("select count(facultyid) from facultydailyactivity where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?) and Subject=?");
	    	p3.setString(1,branch);
	    	p3.setString(2,year);
	    	p3.setString(3,section);
	    	p3.setString(4,startdate);
	    	p3.setString(5,enddate);
	    	p3.setString(6,s);
	    	ResultSet result3=p3.executeQuery();
	    	while(result3.next())
	    	{
	    		total=(double)(result3.getInt(1));
	    		//out.println("<h4>Total no of Days : "+total+"</h4>");
	    	}

			double percentage=(temp/total)*100;
			out.println("<tr><td>"+studentId+"</td><td>"+(int)temp+"</td><td>"+(int)total+"</td><td>"+df.format(percentage)+"</td></tr>");	   
	    }
	   
	    out.println("<tr><td colspan='4'><form method='post' action='ExcelForAdmin.jsp?subjectname="+s+"'>");
	    out.println("<input type='submit' value='GenerateExcel' style='background-color:#0000CC;color:white;margin: 8px 140px;padding:10px 20px;'></form></td></tr>");
	    out.println("</table></center></body>");

			
		}

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
	//st1.setString(4,"P");
	ResultSet rs=st1.executeQuery();
	out.println("<body><center>"+
	"<div style='opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:20px;'>"+
	"<table border='1'>");
	out.println("<caption>"+year+"->"+branch+"->"+section+"<caption>");
	out.println("<tr><th>Name</th><th>Classes Attended</th><th>TotalClassesTaken</th><th>Attendance Percentage</th></tr>");
	
    while(rs.next())
    {
    	String studentId=rs.getString(1);
    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Branch=? and Year=? and Section=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,branch);
    	st2.setString(2,year);
    	st2.setString(3,section);
    	st2.setString(4,studentId);
    	st2.setString(5,"P");
    	st2.setString(6,startdate);
    	st2.setString(7,enddate);
    	ResultSet rs1=st2.executeQuery();
    	
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	}
    	PreparedStatement st3=con.prepareStatement("select count(facultyid) from facultydailyactivity where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?)");
    	st3.setString(1,branch);
    	st3.setString(2,year);
    	st3.setString(3,section);
    	st3.setString(4,startdate);
    	st3.setString(5,enddate);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    	}

		 double percentage=(temp/total)*100;
		 
		out.println("<tr><td>"+studentId+"</td><td>"+(int)temp+"</td><td>"+(int)total+"</td><td>"+df.format(percentage)+"</td></tr>");
		
	
		    
		   
    }
    String all="all";
    out.println("<tr><td colspan='4'><form method='post' action='ExcelForAdmin.jsp?subjectname="+all+"'>");
    out.println("<input type='submit' value='GenerateExcel' style='background-color:#0000CC;color:white;margin: 8px 140px;padding:10px 20px;'></form></td></tr>");
    out.println("</table></center></body>");
    st1.close(); 
	}
	else
	{
		out.println("<body><center><h1>No classes on this date</h1>"
				+"<a href='AdminDashboard.jsp'><b>click here to go back</b></a></center></body>");
	
	}
} 
catch (Exception e) { 
    e.printStackTrace(); 
}}
%>
</body>
</html>