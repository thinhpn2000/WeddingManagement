package com.wedding.service;

import java.util.List;

import com.wedding.models.Service;
import com.wedding.models.ServicePrice;

public interface ServiceService {
	public List<Service> getAllService();
	public List<Service> removeService(List<ServicePrice> listReservedService);
	void addService(Service service);
	void deleteService(int id);
	void updateService(Service service);
}
