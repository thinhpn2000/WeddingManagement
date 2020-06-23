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

	@Override
	public void add(Employee employee) {
		employeeRepository.add(employee);
		
	}

	@Override
	public void delete(int id) {
		employeeRepository.delete(id);
		
	}

	@Override
	public void update(Employee employee) {
		employeeRepository.update(employee);
		
	}

	@Override
	public void reset(int id) {
		employeeRepository.reset(id);
		
	}

	@Override
	public boolean checkUsername(String username) {
		return employeeRepository.checkUsername(username);
	}
	
}
