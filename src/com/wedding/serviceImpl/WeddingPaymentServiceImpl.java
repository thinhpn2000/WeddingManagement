package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.UpdatePayment;
import com.wedding.models.WeddingPayment;
import com.wedding.repository.WeddingPaymentRepository;
import com.wedding.service.WeddingPaymentService;

public class WeddingPaymentServiceImpl implements WeddingPaymentService {
	private WeddingPaymentRepository weddingPaymentRepository;

	public WeddingPaymentServiceImpl() {
		super();
		weddingPaymentRepository = new WeddingPaymentRepository();
	}

	@Override
	public List<WeddingPayment> getAll() {
		return weddingPaymentRepository.getAll();
	}

	@Override
	public WeddingPayment getById(int id) {
		return weddingPaymentRepository.getById(id);
	}

	@Override
	public void update(UpdatePayment updatePayment) {
		weddingPaymentRepository.update(updatePayment);

	}

	@Override
	public void delete(int id) {
		weddingPaymentRepository.delete(id);
		
	}

	@Override
	public void pay(int id, int userID) {
		weddingPaymentRepository.pay(id, userID);
		
	}

}
