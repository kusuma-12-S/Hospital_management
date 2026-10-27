package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.hospital.model.patient;
import com.hospital.util.DBConnection;

public class PatientDAO {

	
	 public int registerPatient(patient p) throws SQLException {
            
	        String sql = "INSERT INTO patient "
	                   + "(patient_name, email, password, phone) "
	                   + "VALUES (?, ?, ?, ?)";

	        try (
	        	
	        		
	        		 Connection con = DBConnection.getConnection();
	        	 
	             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
    
	            ps.setString(1, p.getPatientName());
	            ps.setString(2, p.getPatientEmail());
	            ps.setString(3, p.getPassword());
	            ps.setString(4, p.getPhoneNo());

	            int row= ps.executeUpdate() ;
	            
	            if (row ==1) {
	                try (java.sql.ResultSet rs = ps.getGeneratedKeys()) {
	                	if (rs.next()) {
	                	    int patientId = rs.getInt(1);
	                	    p.setPatientId(patientId);
	                	    return patientId;
	                	}
	                }
	            }
	        }
	        return -1;
	    }
	 
	 
	 
	 

public patient getPatientById(int patientId) throws SQLException {

    String sql = "SELECT patient_id, patient_name, email, phone "
               + "FROM patient WHERE patient_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, patientId);

        try (java.sql.ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                patient p = new patient();

                p.setPatientId(rs.getInt("patient_id"));
                p.setPatientName(rs.getString("patient_name"));
                p.setPatientEmail(rs.getString("email"));
                p.setPhoneNo(rs.getString("phone"));

                return p;
            }
        }
    }

    return null;
}







public boolean updatePatient(patient p) throws SQLException {

    String sql = "UPDATE patient SET patient_name = ?, "
               + "email = ?, phone = ? WHERE patient_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, p.getPatientName());
        ps.setString(2, p.getPatientEmail());
        ps.setString(3, p.getPhoneNo());
        ps.setInt(4, p.getPatientId());

        return ps.executeUpdate() == 1;
    }
}

}
