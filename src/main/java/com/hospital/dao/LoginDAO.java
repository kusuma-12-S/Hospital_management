



package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hospital.model.patient;
import com.hospital.util.DBConnection;

public class LoginDAO {

    public patient validatePatient(String email, String password)
            throws SQLException {

        String sql = "SELECT patient_id, patient_name, email "
                   + "FROM patient WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    patient p = new patient();
                    p.setPatientId(rs.getInt("patient_id"));
                    p.setPatientName(rs.getString("patient_name"));
                    p.setPatientEmail(rs.getString("email"));
                    return p;
                }
            }
        }

        return null;
    }


    }

