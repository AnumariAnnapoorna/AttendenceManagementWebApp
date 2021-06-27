<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.util.*,java.util.HashMap "%>
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
String branch=(String)session.getAttribute("branch");
String year=(String)session.getAttribute("year");
String section=(String)session.getAttribute("section");
String facultyId=(String)session.getAttribute("facultyid");
String subject=request.getParameter("subjects");
System.out.println(subject+""+branch+" "+year+" "+section);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date d2=new Date();
String date=sdf.format(d2);
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver);
	String[] arr=request.getParameterValues("user");
	Map<String,String> map=new HashMap<String,String>();
	for(int i=0;i<arr.length;i++){
		String s=request.getParameter("p"+i);
		map.put(arr[i],s);
	}
		Iterator itr=map.keySet().iterator();
while(itr.hasNext())
{
	
	String studId=(String)itr.next();
	String status=map.get(studId);
	System.out.println(studId);
	System.out.println(status);
	try {
		
		Connection con = DriverManager.getConnection(dbURL + dbName, 
	            dbUsername,  
	            dbPassword);
		PreparedStatement p=con.prepareStatement("insert into attendence value(?,?,?,?,?,?,?,?)");
		p.setString(1,studId);
		p.setString(2,facultyId);
		p.setString(3,subject);
		p.setString(4,status);
		p.setString(5,date);
		p.setString(6,branch);
		p.setString(7,year);
		p.setString(8,section);
		int i=p.executeUpdate();

	}
	catch(Exception e){
		e.printStackTrace();
	}
}
try{
	Connection con = DriverManager.getConnection(dbURL + dbName, 
            dbUsername,  
            dbPassword);
	PreparedStatement p1=con.prepareStatement("insert into facultydailyactivity value(?,?,?,?,?,?)");
	p1.setString(1,facultyId);
	p1.setString(2,subject);
	p1.setString(3,date);
	p1.setString(4,branch);
	p1.setString(5,year);
	p1.setString(6,section);
	int i=p1.executeUpdate();
}
catch(Exception e){
	e.printStackTrace();
}	
%>
<%response.sendRedirect("FacultyNavbar.jsp"); %>
</center>
</body>
</html>