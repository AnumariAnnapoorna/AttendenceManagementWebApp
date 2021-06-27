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

<div style="opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<div class="menu">
<ol >
	<li class="menu" style="padding:0px 10px 0px 10px;"><a onclick="document.getElementById('id01').style.display='block'"><strong>Add Faculty</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a onclick="document.getElementById('id02').style.display='block'"><strong>Add Student</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a onclick="document.getElementById('id03').style.display='block'"><strong>Add Subject</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a href="AdminDashboard.jsp"><strong>View Attendance</strong></a></li>
    <li class="menu" style="padding:0px 10px 0px 350px;"><a href="Logout.jsp" style="float:right;"><strong>Back</strong></a></li>
</ol>
</div>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="AddFaculty.jsp" method="post">
  <center><h1>ADD FACULTY</h1></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
    
<hr>
        <div class="container">
   
          <input type="text" name="fid" placeholder="Faculty Id" required>
          
           <input type="text" name="fname" placeholder="Faculty Name" required>
          
          <input type="text" name="femail" placeholder="Faculty Email" required>
        
          <input type="password" name="fpassword" placeholder="Faculty Password" required>
          
          <input type="text" name="fphno" placeholder="Faculty phno" required>
          
          <input type="text" name="faddress" placeholder="Faculty Address" required>
          
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </div>
    </form>
</div>
<div id="id02" class="modal">
  
  <form class="modal-content animate" action="AddStudent.jsp" method="post">
  <center><h1>ADD STUDENT</h1></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
    
<hr>
        <div class="container">
         
           <input type="text" name="sid" placeholder="Student Id" required>
           
          <input type="text" name="sname" placeholder="Student Name" required>
          
          <input type="text" name="semail" placeholder="Student email" required>
          
          <input type="password" name="spsw" placeholder="Student Password" required>
           
          <input type="text" name="sphno" placeholder="Student Phno" required>
          
          <select name="sbranch" required>
          <option value="">Choose Branch</option>
          <option value="CSE">CSE</option>
          <option value="ECE">ECE</option>
          <option value="EEE">EEE</option>
          <option value="MECH">MECH</option>
          <option value="CIVIL">CIVIL</option>
          </select>
          
          <select name="syear" required>
          <option value="">Choose Year</option>
          <option value="First">I</option>
          <option value="Second">II</option>
          <option value="Third">III</option>
          <option value="Fourth">IV</option>
          </select>
          
           <select name="ssection" required>
          <option value="">Choose Section</option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
          <option value="D">D</option>
          </select>
          
          <input type="text" name="saddress" placeholder="Student Address" required>
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </div>
    </form>
</div>

<div id="id03" class="modal">
  <form class="modal-content animate" action="AddSubject.jsp" method="post">
  <center><h1>ADD SUBJECT</h1></center>
  
   <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
    
<hr>
        <div class="container">
         
          
          
          <select name="subbranch" required>
          <option value="">Choose Branch</option>
          <option value="CSE">CSE</option>
          <option value="ECE">ECE</option>
          <option value="EEE">EEE</option>
          <option value="MECH">MECH</option>
          <option value="CIVIL">CIVIL</option>
          </select>
          
          <select name="subyear" required>
          <option value="">Choose Year</option>
          <option value="First">I</option>
          <option value="Second">II</option>
          <option value="Third">III</option>
          <option value="Fourth">IV</option>
          </select>

          
          <input type="text" name="subjectname" placeholder="Subject Name" required>
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </div>
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