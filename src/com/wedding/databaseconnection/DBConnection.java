package com.wedding.databaseconnection;

import java.sql.Connection;

public class DBConnection {
	
private DBConnection () {};

	private static DBConnection _instance = null;
		
	public static DBConnection getInstance() {
		if(_instance == null) {
			_instance = new DBConnection();
			return _instance;
		}
		return _instance;
	}
	
	public Connection getConnection(int select) {
		switch(select) {
			case 1:
				Connection connectionMySql  = MySqlConnection.getInstance().getConnection();
				return connectionMySql;
			case 2:
				Connection connectionPostgre  = PostgreConnection.getInstance().getConnection();
				return connectionPostgre;
			case 3:
				Connection connectionSqlServer  = SqlServerConnection.getInstance().getConnection();
				return connectionSqlServer;
			default:
				return null;
		}
	}

}
