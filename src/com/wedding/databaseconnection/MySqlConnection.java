package com.wedding.databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	
	private final String url = "jdbc:mysql://localhost:3306/WEDDING_MANAGEMENT";
	
	private final String username = "root";
	private final String password = "thinhthinh";

	private static MySqlConnection _instance = null;
	
	private MySqlConnection () {};
	
	public static MySqlConnection getInstance() {
		if(_instance == null) {
			_instance = new MySqlConnection();
			return _instance;
		}
		return _instance;
	}
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url, username, password);
		} catch(ClassNotFoundException e) {
			System.out.println("KHONG TIM THAY DRIVER");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("KHONG THE KET NOI VOI CSDL");
			e.printStackTrace();
		}
		
		return null;
	}
}
