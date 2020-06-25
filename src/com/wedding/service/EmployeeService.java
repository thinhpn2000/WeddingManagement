package com.wedding.service;

import java.util.List;

import com.wedding.models.Employee;

public interface EmployeeService {
	public List<Employee> getAllEmployee(int userID);
	public void add(Employee employee);
	public void delete(int id);
	public void update (Employee employee);
	public void reset(int id);
	public boolean checkUsername(String username);
	public void changePassword(String password, int userID);
}
