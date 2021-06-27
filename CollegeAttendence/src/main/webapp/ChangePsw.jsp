<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="facultyId" value=<%out.print(session.getAttribute("facultyid"));%> readonly>
   	<input type="password" name="pwd" placeholder="Password">
   	<input type="password" name="repwd" placeholder="Password">       
    <button type="submit" class="btn btn-primary btn-block">Submit</button></div>
</body>
</html>