package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.Employee;
import com.wedding.repository.EmployeeRepository;
import com.wedding.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService{
	
	EmployeeRepository employeeRepository;
	
	public EmployeeServiceImpl() {
		employeeRepository = new EmployeeRepository();
	}

	@Override
	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		return employeeRepository.getAll();
	}
	
}
