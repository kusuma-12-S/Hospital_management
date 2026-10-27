package com.hospital.util;

import java.sql.Connection;

public class testConnection {
	public static void main(String args[]) {
		   try {
			   Connection con = DBConnection.getConnection();
			   
			   if(con != null) {
				   System.out.println("Database connection succesful");
			   }
			   con.close();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
}
