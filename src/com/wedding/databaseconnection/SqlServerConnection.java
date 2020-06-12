package com.wedding.databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlServerConnection {
	private final String url = "jdbc:sqlserver://localhost;databaseName=WEDDING_MANAGEMENT_1;user=sa;password=sa;";

	
	private static SqlServerConnection _instance = null;
	
	private SqlServerConnection () {};
	
	public static SqlServerConnection getInstance() {
		if(_instance == null) {
			_instance = new SqlServerConnection();
			return _instance;
		}
		return _instance;
	}
	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			return DriverManager.getConnection(url);
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
