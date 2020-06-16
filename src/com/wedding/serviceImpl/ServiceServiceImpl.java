package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.Service;
import com.wedding.repository.ServiceRepository;
import com.wedding.service.ServiceService;

public class ServiceServiceImpl implements ServiceService {

	private ServiceRepository serviceRepository;

	public ServiceServiceImpl() {
		serviceRepository = new ServiceRepository();
	}
	
	@Override
	public List<Service> getAllService() {
		return serviceRepository.getAll();
	}

	@Override
	public void addService(Service service) {
		serviceRepository.add(service);

	}

	@Override
	public void deleteService(int id) {
		serviceRepository.delele(id);

	}

	@Override
	public void updateService(Service service) {
		serviceRepository.update(service);
	}

}
