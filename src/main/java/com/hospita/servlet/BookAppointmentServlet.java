
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

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

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

        int doctorId = Integer.parseInt(req.getParameter("doctorId"));
        String date = req.getParameter("appointmentDate");
        String time = req.getParameter("appointmentTime");

        AppointmentDAO dao = new AppointmentDAO();

        try {
            boolean booked = dao.bookAppointment(
                    patientId, doctorId, date, time);

            if (booked) {
                resp.sendRedirect("bookAppointment.jsp?success=true");
            } else {
                resp.sendRedirect("bookAppointment.jsp?error=failed");
            }

        } catch (SQLException e) {
            if ("23000".equals(e.getSQLState())) {
                resp.sendRedirect("bookAppointment.jsp?error=unavailable");
            } else {
                throw new ServletException("Unable to book appointment", e);
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("bookAppointment.jsp?error=invalid");
        }
    }
}
