<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.text.DecimalFormat "%>
    <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
td{
text-align:center;
}
</style>
</head>
<body>
<%

Date date=new Date();
String datestring=date.toString().replace(" ","");
String datestring1=datestring.replace(":","-");
String branch=(String)session.getAttribute("branch");
String year=(String)session.getAttribute("year");
String section=(String)session.getAttribute("section");
String startdate=(String)session.getAttribute("startdate");
String enddate=(String)session.getAttribute("enddate");
String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql://localhost:3306/"; 
String dbName = "attendancereport"; 
String dbUsername = "root"; 
String dbPassword = ""; 
Class.forName(dbDriver); 
double total=0;
double temp=0;
String sub=request.getParameter("subjectname");
out.println(sub);
System.out.println(sub);
if(sub.equals("all")){
try {
	String filename="E://"+year+"_"+branch+"_"+section+"_Release"+datestring1+".xls" ;
	HSSFWorkbook hwb=new HSSFWorkbook();
	HSSFSheet sheet =  hwb.createSheet("new sheet");

	HSSFRow rowhead=   sheet.createRow((short)0);
	rowhead.createCell((short) 0).setCellValue("SNo");
	rowhead.createCell((short) 1).setCellValue("StudentId");
	rowhead.createCell((short) 2).setCellValue("Classes Attended");
	rowhead.createCell((short) 3).setCellValue("Classes Taken");
	rowhead.createCell((short) 4).setCellValue("Attendance Percentage");
	Connection con = DriverManager.getConnection(dbURL + dbName, 
            dbUsername,  
            dbPassword);
	int i=1;
	PreparedStatement st1=con.prepareStatement("select distinct StudentId from attendence where Branch=? and Year=? and Section=?");
	st1.setString(1,branch);
	st1.setString(2,year);
	st1.setString(3,section);
	//st1.setString(4,"P");
	ResultSet rs=st1.executeQuery();
    while(rs.next())
    {
    	String studentId=rs.getString(1);
    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Branch=? and Year=? and Section=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?)");
    	st2.setString(1,branch);
    	st2.setString(2,year);
    	st2.setString(3,section);
    	st2.setString(4,studentId);
    	st2.setString(5,"P");
    	st2.setString(6,startdate);
    	st2.setString(7,enddate);
    	ResultSet rs1=st2.executeQuery();
    	
    	while(rs1.next())
    	{
    		temp=(double)rs1.getInt(1);
    	}
    	PreparedStatement st3=con.prepareStatement("select count(facultyid) from facultydailyactivity where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?)");
    	st3.setString(1,branch);
    	st3.setString(2,year);
    	st3.setString(3,section);
    	st3.setString(4,startdate);
    	st3.setString(5,enddate);
    	ResultSet rs2=st3.executeQuery();
    	while(rs2.next())
    	{
    		total=(double)(rs2.getInt(1));
    		//out.println("<h4>Total no of Days : "+total+"</h4>");
    	}

		//out.println("<h4>Average Percentage : "+(temp/total)*100+"</h4>");
		HSSFRow row=   sheet.createRow((short)i);
row.createCell((short) 0).setCellValue(i);
row.createCell((short) 1).setCellValue(studentId);
row.createCell((short) 2).setCellValue((int)temp);
row.createCell((short) 3).setCellValue((int)total);
DecimalFormat df=new DecimalFormat(".##");
double percentage=(temp/total)*100;
row.createCell((short) 4).setCellValue(df.format(percentage));
		 i++;
    }
  
    FileOutputStream fileOut =  new FileOutputStream(filename);
    hwb.write(fileOut);
    fileOut.close();
    out.println("</table>");
 
   // out.println("<input type='button' name='Generate Excel'>");
    st1.close(); 
    con.close();
    response.sendRedirect("showAdmin.jsp?cnt='zero'");
    
} 
catch (Exception e) { 
    e.printStackTrace(); 
}

}
else
{
	try {
		String filename="E://"+year+"_"+branch+"_"+section+"_"+sub+"_Release"+datestring1+".xls" ;
		HSSFWorkbook hwb=new HSSFWorkbook();
		HSSFSheet sheet =  hwb.createSheet("new sheet");
       HSSFRow rowhead=   sheet.createRow((short)0);
		rowhead.createCell((short) 0).setCellValue("SNo");
		rowhead.createCell((short) 1).setCellValue("StudentId");
		rowhead.createCell((short) 2).setCellValue("Classes Attended");
		rowhead.createCell((short) 3).setCellValue("Classes Taken");
		rowhead.createCell((short) 4).setCellValue("Attendance Percentage");
		Connection con = DriverManager.getConnection(dbURL + dbName, 
	            dbUsername,  
	            dbPassword);
		int i=1;
		PreparedStatement st1=con.prepareStatement("select distinct StudentId from attendence where Branch=? and Year=? and Section=?");
		st1.setString(1,branch);
		st1.setString(2,year);
		st1.setString(3,section);
		//st1.setString(4,sub);
		//st1.setString(4,"P");
		ResultSet rs=st1.executeQuery();
	    while(rs.next())
	    {
	    	String studentId=rs.getString(1);
	    	PreparedStatement st2=con.prepareStatement("select count(*) from attendence where Branch=? and Year=? and Section=? and StudentId=? and AttendenceStatus=? and (Date BETWEEN ? and ?) and Subject=?");
	    	st2.setString(1,branch);
	    	st2.setString(2,year);
	    	st2.setString(3,section);
	    	st2.setString(4,studentId);
	    	st2.setString(5,"P");
	    	st2.setString(6,startdate);
	    	st2.setString(7,enddate);
	    	st2.setString(8,sub);
	    	ResultSet rs1=st2.executeQuery();
	    	
	    	while(rs1.next())
	    	{
	    		temp=(double)rs1.getInt(1);
	    	}
	    	PreparedStatement st3=con.prepareStatement("select count(facultyid) from facultydailyactivity where Branch=? and Year=? and Section=? and (Date BETWEEN ? and ?) and Subject=?");
	    	st3.setString(1,branch);
	    	st3.setString(2,year);
	    	st3.setString(3,section);
	    	st3.setString(4,startdate);
	    	st3.setString(5,enddate);
	    	st3.setString(6,sub);
	    	
	    	ResultSet rs2=st3.executeQuery();
	    	while(rs2.next())
	    	{
	    		total=(double)(rs2.getInt(1));
	    		//out.println("<h4>Total no of Days : "+total+"</h4>");
	    	}

			//out.println("<h4>Average Percentage : "+(temp/total)*100+"</h4>");
			HSSFRow row=   sheet.createRow((short)i);
	row.createCell((short) 0).setCellValue(i);
	row.createCell((short) 1).setCellValue(studentId);
	row.createCell((short) 2).setCellValue((int)temp);
	row.createCell((short) 3).setCellValue((int)total);
	DecimalFormat df=new DecimalFormat(".##");
	double percentage=(temp/total)*100;
	row.createCell((short) 4).setCellValue(df.format(percentage));
			 i++;
			    
			   
	    }
	  
	    FileOutputStream fileOut =  new FileOutputStream(filename);
	    hwb.write(fileOut);
	    fileOut.close();
	    out.println("</table>");
	 
	   // out.println("<input type='button' name='Generate Excel'>");
	    st1.close(); 
	    con.close();
	    response.sendRedirect("showAdmin.jsp?cnt='zero'");
	    
	} 
	catch (Exception e) { 
	    e.printStackTrace(); 
	}
}
%>
</body>
</html>