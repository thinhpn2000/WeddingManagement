package com.wedding.service;


import java.util.List;

import com.wedding.dto.MonthRevenueDTO;
import com.wedding.models.Reservation;

public interface ReservationService {
	public void addReservation(Reservation reservation);
	public String getTotalRevenue(int year);
	public List<MonthRevenueDTO> getMonthRevenue(int year, int month);
}
