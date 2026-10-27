
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.hospital.dao.LoginDAO;
import com.hospital.model.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            LoginDAO dao = new LoginDAO();
            patient p = dao.validatePatient(email, password);

            if (p != null) {
                HttpSession session = req.getSession();

                session.setAttribute("patientId", p.getPatientId());
                session.setAttribute("patientName", p.getPatientName());
                session.setAttribute("patientEmail", p.getPatientEmail());

                resp.sendRedirect("patientDashboard.jsp");
            } else {
                resp.sendRedirect("login.jsp?error=invalid");
            }

        } catch (SQLException e) {
            throw new ServletException("Login failed due to a database error", e);
        }
    }
}
