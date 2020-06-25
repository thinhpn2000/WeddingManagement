package com.wedding.serviceImpl;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.dto.MonthRevenueDTO;
import com.wedding.models.Food;
import com.wedding.models.Lobby;
import com.wedding.models.Reservation;
import com.wedding.repository.ReservationRepository;
import com.wedding.service.ReservationService;

public class ReservationServiceImpl implements ReservationService {
	ReservationRepository reservationRepository;

	public ReservationServiceImpl() {
		reservationRepository = new ReservationRepository();
	}

	@Override
	public void addReservation(Reservation reservation) {
		reservationRepository.add(reservation);
	}

	@Override
	public String getTotalRevenue(int year) {
		return reservationRepository.getTotalRevenue(year);
	}

	@Override
	public List<MonthRevenueDTO> getMonthRevenue(int year, int month) {
		String json = reservationRepository.getMonthRevenue(year, month);
		Gson gson = new Gson();
		Type monthRevenueType = new TypeToken <ArrayList<MonthRevenueDTO>>() {}.getType();
		return gson.fromJson(json,monthRevenueType);
	}

	
}
