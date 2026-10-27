
package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Doctor;
import com.hospital.util.DBConnection;

public class DoctorDAO {

    public List<Doctor> getAllDoctors() throws SQLException {

        List<Doctor> doctors = new ArrayList<>();

        String sql = "SELECT doctor_id, doctor_name, specialization FROM doctor";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Doctor d = new Doctor();

                d.setDoctorId(rs.getInt("doctor_id"));
                d.setDoctorName(rs.getString("doctor_name"));
                d.setSpecialization(rs.getString("specialization"));

                doctors.add(d);
            }
        }

        return doctors;
    }
    
    
    
    
    
    

public boolean addDoctor(Doctor doctor) throws SQLException {
    String sql = "INSERT INTO doctor (doctor_name, specialization) VALUES (?, ?)";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, doctor.getDoctorName());
        ps.setString(2, doctor.getSpecialization());

        return ps.executeUpdate() == 1;
    }
}










public boolean updateDoctor(Doctor doctor) throws SQLException {

    String sql = "UPDATE doctor SET doctor_name = ?, "
               + "specialization = ? WHERE doctor_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, doctor.getDoctorName());
        ps.setString(2, doctor.getSpecialization());
        ps.setInt(3, doctor.getDoctorId());

        return ps.executeUpdate() == 1;
    }
}



    
    
    
    
    
    
}
