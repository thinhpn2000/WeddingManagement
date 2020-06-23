package com.wedding.service;

import java.util.List;

import com.wedding.models.UpdatePayment;
import com.wedding.models.WeddingPayment;

public interface WeddingPaymentService {
	public List<WeddingPayment> getAll();
	public WeddingPayment getById(int id);
	public void update(UpdatePayment updatePayment);
	public void delete(int id);
	public void pay(int id);
}
