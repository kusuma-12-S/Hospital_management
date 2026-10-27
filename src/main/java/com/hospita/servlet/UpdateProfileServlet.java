
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.hospital.dao.PatientDAO;
import com.hospital.model.patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("patientId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int patientId = (Integer) session.getAttribute("patientId");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()) {
            resp.sendRedirect("patientProfile?error=empty");
            return;
        }

        patient p = new patient();
        p.setPatientId(patientId);
        p.setPatientName(name.trim());
        p.setPatientEmail(email.trim());
        p.setPhoneNo(phone.trim());

        try {
            PatientDAO dao = new PatientDAO();

            if (dao.updatePatient(p)) {
                session.setAttribute("patientName", p.getPatientName());
                session.setAttribute("patientEmail", p.getPatientEmail());

                resp.sendRedirect("patientProfile?success=true");
            } else {
                resp.sendRedirect("patientProfile?error=failed");
            }

        } catch (SQLException e) {
            throw new ServletException("Unable to update patient profile", e);
        }
    }
}
