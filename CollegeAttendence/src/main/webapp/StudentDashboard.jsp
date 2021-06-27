<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<style>
h2,td{
color:#000066;
}
</style>
</head>
<body>
<center>
<div style="opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<form action="showStudent.jsp" method="post" style="font-weight:bold;margin:30px 20px 30px 20px">
<table>
<span><a href="StudentNavbar.jsp" style="padding:0px 0px 0px 10px;float:right;"><strong>&times;</strong></a></span>
<caption><h2>StudentDashboard</h2></caption>
   <tr>
   <td><strong>Select Start Date</strong></td>
   <td><input type="date" name="startdate" placeholder="startdate" required></td>
   </tr>
   <tr>
   <td><strong>Select End Date</strong></td>
    <td><input type="date" name="enddate" placeholder="enddate" required></td>
   </tr>
   
   <tr>
   
    <td><input type="radio" name="additional" value="subjectWise" required><strong id="val">SubjectWise</strong>
    </td><td>
   <input type="radio" name="additional" value="overall"><strong id="val">OverAll</strong>
    </td>
   </tr>
    <tr><td colspan='2'><button type="submit" ">GenerateInfo</button></td></tr>
    
  </div>
  </table>
</form>
</div>
</center>
</body>
</html>