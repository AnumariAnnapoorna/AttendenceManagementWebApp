<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<center>
<div style="opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<form action="showAdmin.jsp?cnt='one'" method="post" style="font-weight:bold;margin:30px 20px 30px 20px">
<span><a href="AdminNavbar.jsp" style="padding:0px 0px 0px 10px;float:right;"><strong>&times;</strong></a></span>
<table>
<caption><h3>AdminDashboard</h3></caption> 
<tr>
  <div class="container">
  <td ><strong>Select Branch</strong></td>
   <td>
        <input type="radio" name="branch" value="CSE" required><strong id="val">CSE</strong>
        <input type="radio" name="branch" value="ECE"><strong id="val">ECE</strong>
        <input type="radio" name="branch" value="EEE"><strong id="val">EEE</strong>
        <input type="radio" name="branch" value="MECH"><strong id="val">MECH</strong>
        <input type="radio" name="branch" value="CIVIL"><strong id="val">CIVIL</strong>
   </td>
   </tr>
   <tr>
   <td ><strong>Select Year</strong></td>
   <td>
        <input type="radio" name="year" value="First" required><strong id="val">First</strong>
        <input type="radio" name="year" value="Second"><strong id="val">Second</strong>
        <input type="radio" name="year" value="Third"><strong id="val">Third</strong>
        <input type="radio" name="year" value="Fourth"><strong id="val">Forth</strong>
      
   </td>
   </tr>
    <tr>
    <td ><strong>Select Section</strong></td>
   <td>
        <input type="radio" name="section" value="A" required><strong id="val">A</strong>
        <input type="radio" name="section" value="B"><strong id="val">B</strong>
        <input type="radio" name="section" value="C"><strong id="val">C</strong>
        <input type="radio" name="section" value="D"><strong id="val">D</strong>
   </td>
   </tr>
   
   <tr>
   <td ><strong>Select Start Date</strong></td>
   <td><input type="date" name="startdate" placeholder="startdate" required></td>
   </tr>
   <tr>
   <td ><strong>Select End Date</strong></td>
    <td><input type="date" name="enddate" placeholder="enddate" required></td>
   </tr>
    <tr><td colspan='2' align='center'><button type="submit" ">GenerateInfo</button></td></tr>
    
  </div>
  </table>
</form>
</center>
</body>
</html>