
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.hospital.dao.DoctorDAO;
import com.hospital.model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Only authenticated admins can add doctors
        if (session == null
                || !Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
            resp.sendRedirect("adminLogin.jsp");
            return;
        }

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("doctorName");
        String specialization = req.getParameter("specialization");

        if (name == null || name.trim().isEmpty()
                || specialization == null
                || specialization.trim().isEmpty()) {
            resp.sendRedirect("addDoctor.jsp?error=empty");
            return;
        }

        if (name.trim().length() > 45
                || specialization.trim().length() > 100) {
            resp.sendRedirect("addDoctor.jsp?error=failed");
            return;
        }

        Doctor doctor = new Doctor();
        doctor.setDoctorName(name.trim());
        doctor.setSpecialization(specialization.trim());

        try {
            DoctorDAO dao = new DoctorDAO();

            if (dao.addDoctor(doctor)) {
                resp.sendRedirect("addDoctor.jsp?success=true");
            } else {
                resp.sendRedirect("addDoctor.jsp?error=failed");
            }

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                resp.sendRedirect("addDoctor.jsp?error=duplicate");
            } else {
                throw new ServletException(
                    "Unable to add doctor", e);
            }
        }
    }
}
