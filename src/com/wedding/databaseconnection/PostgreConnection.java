package com.wedding.databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgreConnection {
	private final String url = "jdbc:postgresql://localhost/wedding-service(1)";
	
	private final String username = "postgres";
	private final String password = "134263";

	private static PostgreConnection _instance = null;
	
	private PostgreConnection () {};
	
	public static PostgreConnection getInstance() {
		if(_instance == null) {
			_instance = new PostgreConnection();
			return _instance;
		}
		return _instance;
	}
	public Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			System.out.println("KHONG TIM THAY DRIVER");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("KHONG THE KET NOI VOI CSDL");
			e.printStackTrace();
		}
		
		return null;
	}
}
