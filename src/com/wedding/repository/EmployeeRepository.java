package com.wedding.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wedding.databaseconnection.MySqlConnection;
import com.wedding.models.Employee;

public class EmployeeRepository {
	public List<Employee> getAll() {
		String query = "SELECT * FROM `USER` WHERE isDeleted = false";
		Connection connection = MySqlConnection.getInstance().getConnection();
		List<Employee> employeeList = new ArrayList<Employee>();
		try {
			PreparedStatement prep = connection.prepareStatement(query);
			ResultSet res = prep.executeQuery();
			while(res.next()) {
				Employee newEmployee = new Employee();
				newEmployee.setUserID(res.getInt("userID"));
				newEmployee.setFullname(res.getString("fullname"));
				newEmployee.setUsername(res.getString("username"));
				newEmployee.setGender(res.getString("gender"));
				newEmployee.setDOB(res.getString("DOB"));
				newEmployee.setJoiningDate(res.getString("joiningDate"));
				newEmployee.setSalary(res.getInt("salary"));
				employeeList.add(newEmployee);
			}
			connection.close();
			return employeeList;     	
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}
