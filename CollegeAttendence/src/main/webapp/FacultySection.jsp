 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("branch",request.getParameter("branch"));
session.setAttribute("year",request.getParameter("year"));
session.setAttribute("section",request.getParameter("section"));
ArrayList<String> arr=new ArrayList<String>();
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
	PreparedStatement ps=con.prepareStatement("select distinct Subject from facultydailyactivity where Branch=? and Year=? and Section=? and FacultyId=?");
	ps.setString(1,request.getParameter("branch"));
	ps.setString(2,request.getParameter("year"));
	ps.setString(3,request.getParameter("section"));
	ps.setString(4,(String)session.getAttribute("facultyid"));
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		arr.add(rs.getString("Subject"));
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>
<center>
<div style="opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<form action="showFaculty.jsp" method="post" style="font-weight:bold;margin:30px 20px 30px 20px">
<span><a href="FacultyNavbar.jsp" style="padding:0px 0px 0px 10px;float:right;"><strong>&times;</strong></a></span>
<table>
<caption><h3>FacultyDashboard</h3></caption>
<tr>

   <td><strong>Select Subject</strong></td>
   <td><%
out.println("<select name='subjects'>");
for(int j=0;j<arr.size();j++)
{
	out.println("<option value='"+arr.get(j)+"'>"+arr.get(j)+"</option>");

}
out.println("</select>");
%></td>
   </tr>
   <tr>
   <td><strong>Select StartDate</strong></td>
   <td><input type="date" name="startdate" placeholder="startdate" required></td>
   </tr>
   <tr>
   <td><strong>Select EndDate</strong></td>
    <td><input type="date" name="enddate" placeholder="enddate" required></td>
   </tr>
    <tr><td colspan='2'><button type="submit" ">Submit</button></td></tr>
   </div>
  </table>
</form>
</div>
</center>
</body>
</html>