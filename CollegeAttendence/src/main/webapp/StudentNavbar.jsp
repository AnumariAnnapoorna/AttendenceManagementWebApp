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
	<li class="menu" style="padding:0px 10px 0px 10px;"><a href="StudentDashboard.jsp"><strong>View Attendance</strong></a></li>
	<li class="menu" style="padding:0px 10px 0px 10px;"><a href="ChangePsw.jsp"><strong>Change Password</strong></a></li>
    <li class="menu" style="padding:0px 10px 0px 550px;"><a href="Logout.jsp" style="float:right;"><strong>Back</strong></a></li>
</ol>
</div>

</div>

</body>
</html>