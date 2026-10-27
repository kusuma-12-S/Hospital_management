package com.hospita.servlet;




	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.SQLException;

import com.hospital.dao.PatientDAO;
import com.hospital.model.patient;
import com.hospital.util.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


	@WebServlet("/register")
	public class register extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			try {
				PatientDAO pd = new PatientDAO();
				
				
				

				
				
				 
				 String name = req.getParameter("name");
				 String email = req.getParameter("email");
				 String pass=req.getParameter("pass");
				 String conpass= req.getParameter("conPass");
				 String phone = req.getParameter("phone");
				
				 patient p = new patient();
				 p.setPatientName(name);
				 p.setPatientEmail(email);
				 p.setPassword(pass);
				 p.setPhoneNo(phone);
				 
				 if(!pass.equals(conpass)) {
					 resp.getWriter().println("Password does not match");	
					 return;
					 }
				 
				 HttpSession session = req.getSession();
				 
				 
				int res=  pd.registerPatient(p);
				
				 if(res>0) {
					 session.setAttribute("patientId", p.getPatientId());
					    session.setAttribute("patientName", name);
					    session.setAttribute("patientEmail", email);
					    resp.sendRedirect("patientDashboard.jsp?success=true");
					    return;
				 }else {
					 resp.sendRedirect("register.jsp.jsp?fail=true");
				 }

					
				 
				 
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			    resp.getWriter().println("Registration failed. Check the server console.");
			}
			
		}
	   
		
	}

