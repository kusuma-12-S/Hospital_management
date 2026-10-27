
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.hospital.dao.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myAppointments")
public class MyAppointmentsServlet extends HttpServlet {

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
            AppointmentDAO dao = new AppointmentDAO();

            List<String[]> appointments =
                    dao.getPatientAppointments(patientId);

            req.setAttribute("appointments", appointments);

            req.getRequestDispatcher("myAppointments.jsp")
               .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(
                    "Unable to load appointments", e);
        }
    }
}
