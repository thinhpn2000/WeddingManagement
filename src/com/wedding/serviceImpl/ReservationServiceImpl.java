package com.wedding.serviceImpl;

import java.util.List;

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

	
}
