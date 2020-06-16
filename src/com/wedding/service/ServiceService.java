package com.wedding.service;

import java.util.List;

import com.wedding.models.Service;

public interface ServiceService {
	public List<Service> getAllService();
	void addService(Service service);
	void deleteService(int id);
	void updateService(Service service);
}
