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
	public List<Employee> getAllEmployee(int userID) {
		// TODO Auto-generated method stub
		List<Employee> listEmployee = employeeRepository.getAll();
		for(Employee employee : listEmployee) {
			if(employee.getUserID() == userID) {
				listEmployee.remove(employee);
				break;
			}
		}
		return listEmployee;
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

	@Override
	public void changePassword(String password, int userID) {
		employeeRepository.changePassword(password, userID);
		
	}
	
}
