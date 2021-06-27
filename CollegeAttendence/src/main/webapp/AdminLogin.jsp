<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="./ValidateAdmin" method="post" name="login">
<table>
<caption><h3>Login</h3></caption>
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
    <tr><td><button type="submit" onclick="return validate()">Login</button></td></tr>
  </div>
  </table>
</form>
</center>
</body>
</html>