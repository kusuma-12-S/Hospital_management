
package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.util.DBConnection;

public class AppointmentDAO {

    // Book appointment
    public boolean bookAppointment(int patientId, int doctorId,
            String appointmentDate, String appointmentTime)
            throws SQLException {

        String sql = "INSERT INTO appointment "
                + "(patient_id, doctor_id, appointment_date, "
                + "appointment_time, status) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, patientId);
            ps.setInt(2, doctorId);
            ps.setString(3, appointmentDate);
            ps.setString(4, appointmentTime);
            ps.setString(5, "Booked");

            return ps.executeUpdate() == 1;
        }
    }

    // Get appointments for one patient
    public List<String[]> getPatientAppointments(int patientId)
            throws SQLException {

        List<String[]> appointments = new ArrayList<>();

        String sql = "SELECT a.appointment_id, d.doctor_name, "
                + "d.specialization, a.appointment_date, "
                + "a.appointment_time, a.status "
                + "FROM appointment a "
                + "JOIN doctor d ON a.doctor_id = d.doctor_id "
                + "WHERE a.patient_id = ? "
                + "ORDER BY a.appointment_date, a.appointment_time";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, patientId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    appointments.add(new String[] {
                        String.valueOf(rs.getInt("appointment_id")),
                        rs.getString("doctor_name"),
                        rs.getString("specialization"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_time"),
                        rs.getString("status")
                    });
                }
            }
        }

        return appointments;
    }
    
    
    
    
    

public boolean cancelAppointment(int appointmentId, int patientId)
        throws SQLException {

    String sql = "UPDATE appointment "
               + "SET status = ? "
               + "WHERE appointment_id = ? "
               + "AND patient_id = ? "
               + "AND status = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, "Cancelled");
        ps.setInt(2, appointmentId);
        ps.setInt(3, patientId);
        ps.setString(4, "Booked");

        return ps.executeUpdate() == 1;
    }
}

    




public List<String[]> getAllAppointments() throws SQLException {

    List<String[]> appointments = new ArrayList<>();

    String sql = "SELECT a.appointment_id, p.patient_name, "
            + "d.doctor_name, d.specialization, "
            + "a.appointment_date, a.appointment_time, a.status "
            + "FROM appointment a "
            + "JOIN patient p ON a.patient_id = p.patient_id "
            + "JOIN doctor d ON a.doctor_id = d.doctor_id "
            + "ORDER BY a.appointment_date, a.appointment_time";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            appointments.add(new String[] {
                String.valueOf(rs.getInt("appointment_id")),
                rs.getString("patient_name"),
                rs.getString("doctor_name"),
                rs.getString("specialization"),
                rs.getString("appointment_date"),
                rs.getString("appointment_time"),
                rs.getString("status")
            });
        }
    }

    return appointments;
}

    
    
    
}
