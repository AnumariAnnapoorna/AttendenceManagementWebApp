package org.Major.CollegeAttendence;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Major.CollegeAttendence.DatabaseConnection;

/**
 * Servlet implementation class ValidateAdmin
 */
public class ValidateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{ 
		PrintWriter out=response.getWriter();
		String email=request.getParameter("name");
		String password=request.getParameter("psw");
		String role=request.getParameter("role");
		HttpSession mysession=request.getSession();
		if(role.equals("admin"))
		{
		if(email.equals("admin")&&password.equals("admin"))
		{
			mysession.removeAttribute("errorMessage");
			response.sendRedirect("AdminNavbar.jsp");
		}
		else
		{
			mysession.setAttribute("errorMessage","Invalid credentials");
			out.println(mysession.getAttribute("errorMessage"));
			response.sendRedirect("Login.jsp");
		}
		}
		else if(role.equals("faculty"))
		{
	        try {
	            Connection con = DatabaseConnection.initializeDatabase(); 
	            PreparedStatement st = con 
	                   .prepareStatement("select * from faculty where FacultyId=? and Password=?"); 
	            st.setString(1, email);
	            st.setString(2, password); 
	            HttpSession session=request.getSession();
	            session.setAttribute("facultyid", email);
	            ResultSet rs=st.executeQuery(); 
	            if(rs.next())
	            {
	            	mysession.removeAttribute("errorMessage");
	            	 response.sendRedirect("FacultyNavbar.jsp");
	            }
	            else
	            {
	            	mysession.setAttribute("errorMessage","Invalid credentials");
	    			out.println(mysession.getAttribute("errorMessage"));
	    			response.sendRedirect("Login.jsp");
	            }
	            st.close(); 
	            con.close();   
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
		}

		else if(role.equals("student"))
		{
		
			try {
	            Connection con = DatabaseConnection.initializeDatabase(); 
	            PreparedStatement st = con 
	                   .prepareStatement("select * from student where StudentId=? and StudentPassword=?"); 
	            st.setString(1, email);
	            st.setString(2, password); 
	            HttpSession session=request.getSession();
	            session.setAttribute("studentid", email);
	            ResultSet rs=st.executeQuery(); 
	            if(rs.next())
	            {
	            	mysession.removeAttribute("errorMessage");
	            	 response.sendRedirect("StudentNavbar.jsp");
	            }
	            else
	            {
	            	mysession.setAttribute("errorMessage","Invalid credentials");
	    			out.println(mysession.getAttribute("errorMessage"));
	    			response.sendRedirect("Login.jsp");
	            }
	            st.close(); 
	            con.close();   
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
		}

	}

}
