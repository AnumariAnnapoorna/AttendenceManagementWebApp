<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>
<%String name=request.getParameter("filename");%>
<%try{
HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sheet = wb.createSheet("new sheet");
HSSFRow row = sheet.createRow((short)0);
HSSFCell cell = row.createCell((short)0);
cell.setCellValue(1);
//row.createCell((short)1).setCellValue(1.2);
//row.createCell((short)2).setCellValue("amkit Kumar ");
//row.createCell((short)3).setCellValue(true);
FileOutputStream fileOut = new FileOutputStream("E:\\"+name+".xls");
wb.write(fileOut);
fileOut.close(); 
}catch ( Exception ex ){ 
	ex.printStackTrace();
} 
%>
Successfully created file.