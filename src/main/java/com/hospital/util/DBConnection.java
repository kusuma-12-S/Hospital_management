package com.hospital.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
public static Connection getConnection() throws SQLException{
	
	 try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new SQLException("MySQL JDBC driver not found", e);
	    }

		
		String url ="jdbc:mysql://localhost:3306/hospital_db";
		String username = "username";
		String password= "password";
		
		Connection con = DriverManager.getConnection(url, username, password);
		return con;
	}
	
}
