
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

@WebServlet("/updateDoctor")
public class UpdateDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            !Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            int doctorId = Integer.parseInt(
                request.getParameter("doctorId"));

            String doctorName = request.getParameter("doctorName");
            String specialization = request.getParameter("specialization");

            if (doctorName == null || doctorName.trim().isEmpty()
                    || specialization == null
                    || specialization.trim().isEmpty()) {
                response.sendRedirect(
                    "adminDoctors?error=empty");
                return;
            }

            Doctor doctor = new Doctor();
            doctor.setDoctorId(doctorId);
            doctor.setDoctorName(doctorName.trim());
            doctor.setSpecialization(specialization.trim());

            boolean updated = new DoctorDAO().updateDoctor(doctor);

            if (updated) {
                response.sendRedirect("adminDoctors?updated=true");
            } else {
                response.sendRedirect("adminDoctors?error=notfound");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("adminDoctors?error=invalid");
        } catch (SQLException e) {
            throw new ServletException("Unable to update doctor", e);
        }
    }
}
