
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.hospital.dao.DoctorDAO;
import com.hospital.model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctors")
public class DoctorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("patientId") == null) {
            resp.sendRedirect("register.jsp");
            return;
        }

        try {
            DoctorDAO dao = new DoctorDAO();
            List<Doctor> doctors = dao.getAllDoctors();

            req.setAttribute("doctors", doctors);

            req.getRequestDispatcher("bookAppointment.jsp")
               .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Unable to load doctors", e);
        }
    }
}
