
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

@WebServlet("/patientProfile")
public class PatientProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("patientId") == null) {
            resp.sendRedirect("register.jsp");
            return;
        }

        int patientId = (Integer) session.getAttribute("patientId");

        try {
            PatientDAO dao = new PatientDAO();
            patient p = dao.getPatientById(patientId);

            if (p == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND,
                        "Patient not found");
                return;
            }

            req.setAttribute("patient", p);

            req.getRequestDispatcher("patientProfile.jsp")
               .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Unable to load patient profile", e);
        }
    }
}
