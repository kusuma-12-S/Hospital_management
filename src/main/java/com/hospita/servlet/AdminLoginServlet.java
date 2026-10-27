
package com.hospita.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.hospital.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            AdminDAO dao = new AdminDAO();

            if (dao.validateAdmin(username, password)) {
                HttpSession session = req.getSession(true);

                session.setAttribute("adminUsername", username);
                session.setAttribute("isAdmin", true);

                resp.sendRedirect("adminDashboard.jsp");
            } else {
                resp.sendRedirect("adminLogin.jsp?error=invalid");
            }

        } catch (SQLException e) {
            throw new ServletException("Admin login failed", e);
        }
    }
}
