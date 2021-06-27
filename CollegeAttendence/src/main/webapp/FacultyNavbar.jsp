<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<style>
a,h2,td{
color:#000066;

}
.menu ol {
    list-style-type: none;
    padding-left: 0;
}

.menu {
    display: inline-block;
}

.menu a::after {
    display: inline-block;
    font-size: 80%;
    font-weight: bold;

}
</style>
</head>
<body>
<div style="opacity:0.9;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<div class="menu">
<ol >
	<li class="menu" style="padding:0px 10px 0px 10px;"><a onclick="document.getElementById('id01').style.display='block'"><strong>Add Attendance</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a href="FacultyDashboard.jsp"><strong>View Attendance</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a href="ChangePsw.jsp"><strong>Change Password</strong></a></li>
    <li class="menu" style="padding:0px 10px 0px 400px;"><a href="Logout.jsp" style="float:right;"><strong>Back</strong></a></li>
</ol>
</div>
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="AddAttendance.jsp" method="post">
  <center><h1>SELECT DETAILS</h1></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
    
<hr>
        <div class="container">
   
          <select name="fabranch" required>
     <option value="">Choose Branch</option>
     <option value="CSE">CSE</option>
     <option value="ECE">ECE</option>
     <option value="EEE">EEE</option>
     <option value="MECH">MECH</option>
     <option value="CIVIL">CIVIL</option>
     </select>
          
          <select name="fayear" required>
          <option value="">Choose Year</option>
          <option value="First">I</option>
          <option value="Second">II</option>
          <option value="Third">III</option>
          <option value="Fourth">IV</option>
          </select>
          
           <select name="fasection" required>
          <option value="">Choose Section</option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
          <option value="D">D</option>
          </select>
          
      <button type="submit" class="btn btn-primary btn-block">Submit</button></div>
    </form>
</div>
</div>
<script>
var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>