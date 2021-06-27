
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body >
<center>
<div style="opacity:0.8;border:0px solid black;background-color:#ccccff;margin:60px 200px;padding:0px;">
<form action="./ValidateAdmin" method="post" style="font-weight:bold;margin:30px 20px 30px 20px">
<table>
<caption><h3>Login</h3></caption>
<%
if(session.getAttribute("errorMessage")!=null)
out.println("<h1>"+session.getAttribute("errorMessage")+"</h1>");
session.removeAttribute("errorMessage");
%>
<tr>
  <div class="container">
   <td>
   <input type="text" placeholder="Name" name="name" required>
   </td>
   </tr>
   <tr>
   <td>
   <input type="password" placeholder="password" name="psw" required>
   </td>
   </tr>
   <tr><td>
   <input type="radio" name="role" value="admin" required><strong id="val">Admin</strong>
        <input type="radio" name="role" value="faculty"><strong id="val"">Faculty</strong>
        <input type="radio" name="role" value="student"><strong id="val">Student</strong>
   </td>
   </tr>
    <tr><td><button type="submit" onclick="return validate()"><strong>Login</strong></button></td></tr>
  </div>
  </table>
</form>
</div>
</center>
</body>
</html>