
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.hospital.dao.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cancelAppointment")
public class CancelAppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("patientId") == null) {
            resp.sendRedirect("register.jsp");
            return;
        }

        int patientId = (Integer) session.getAttribute("patientId");

        try {
            int appointmentId = Integer.parseInt(
                    req.getParameter("appointmentId"));

            AppointmentDAO dao = new AppointmentDAO();

            boolean cancelled =
                    dao.cancelAppointment(appointmentId, patientId);

            if (cancelled) {
                resp.sendRedirect("myAppointments?message=cancelled");
            } else {
                resp.sendRedirect("myAppointments?message=failed");
            }

        } catch (NumberFormatException e) {
            resp.sendRedirect("myAppointments?message=invalid");
        } catch (SQLException e) {
            throw new ServletException(
                    "Unable to cancel appointment", e);
        }
    }
}
