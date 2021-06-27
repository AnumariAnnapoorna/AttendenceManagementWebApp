<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,java.text.DecimalFormat,java.util.Date"%>
     <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Date date=new Date();
String datestring=date.toString().replace(" ","");
String datestring1=datestring.replace(":","-");
String studentid=(String)session.getAttribute("studentid");
String startdate=(String)session.getAttribute("startdate");
String enddate=(String)session.getAttribute("enddate");
String subject=(String)session.getAttribute("subject");
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver);
Connection con = DriverManager.getConnection(dbURL + dbName, 
        dbUsername,  
        dbPassword);
try {
	
	String namefile=studentid+"_"+subject+"_Release"+datestring1;
	String filename="E://"+namefile+".xls" ;
	HSSFWorkbook hwb=new HSSFWorkbook();
	HSSFSheet sheet =  hwb.createSheet("new sheet");

	HSSFRow rowhead=   sheet.createRow((short)0);
	rowhead.createCell((short) 0).setCellValue("SNo");
	rowhead.createCell((short) 1).setCellValue("StudentId");
	rowhead.createCell((short) 2).setCellValue("Subject");
	rowhead.createCell((short) 3).setCellValue("Classes Attended");
	rowhead.createCell((short) 4).setCellValue("Classes Taken");
	rowhead.createCell((short) 5).setCellValue("Attendance Percentage");
	
	int i=1;
    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Subject=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,subject);
    	st2.setString(2,studentid);
    	st2.setString(3,"P");
    	st2.setString(4,startdate);
    	st2.setString(5,enddate);
    	ResultSet rs1=st2.executeQuery();
     double temp=0,total=0;
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	}
    	PreparedStatement st3=con.prepareStatement("select count(*) from attendence where Subject=? and StudentId=? and (Date BETWEEN ? and ?)");
    	st3.setString(1,subject);
    	st3.setString(2,studentid);
    	st3.setString(3,startdate);
    	st3.setString(4,enddate);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    	}
		HSSFRow row=   sheet.createRow((short)i);
row.createCell((short) 0).setCellValue(i);
row.createCell((short) 1).setCellValue(studentid);
row.createCell((short) 2).setCellValue(subject);
row.createCell((short) 3).setCellValue((int)temp);
row.createCell((short) 4).setCellValue((int)total);
double percentage=(temp/total)*100;
DecimalFormat df=new DecimalFormat(".##");
row.createCell((short) 5).setCellValue(df.format(percentage));
		 i++;
    
FileOutputStream fileOut =  new FileOutputStream(filename);
hwb.write(fileOut);
fileOut.close();
response.sendRedirect("StudentDashboard.jsp");
} 
catch (Exception e) { 
    e.printStackTrace(); 
}

%>
</body>
</html>