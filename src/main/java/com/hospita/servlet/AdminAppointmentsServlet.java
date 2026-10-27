
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

@WebServlet("/adminAppointments")
public class AdminAppointmentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            !Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            AppointmentDAO dao = new AppointmentDAO();

            List<String[]> appointments = dao.getAllAppointments();

            request.setAttribute("appointments", appointments);

            request.getRequestDispatcher("/adminAppointments.jsp")
                   .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(
                "Unable to load appointments", e);
        }
    }
}
