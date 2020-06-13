package com.wedding.service;

import java.util.List;

import com.wedding.models.Service;

public interface ServiceService {
	void addService(Service service);
	void deleteService(int id);
	public Service getServiceById(int id);
	public List<Service> getAllService();
	void updateService(Service service);
}
