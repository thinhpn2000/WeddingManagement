package com.wedding.models;

import java.util.List;

public class UpdatePayment {
	private int weddingID;
	private String phone;
	private int tableQuantity;
	private int reservedTable;
	private List<Integer> listFoodID;
	private List<ServicePair> listServiceReservation;
	private List<ServicePair> listOldServiceReservation;
	public UpdatePayment() {
		super();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTableQuantity() {
		return tableQuantity;
	}

	public void setTableQuantity(int tableQuantity) {
		this.tableQuantity = tableQuantity;
	}

	public int getReservedTable() {
		return reservedTable;
	}

	public void setReservedTable(int reservedTable) {
		this.reservedTable = reservedTable;
	}

	public List<Integer> getListFoodID() {
		return listFoodID;
	}

	public void setListFoodID(List<Integer> listFoodID) {
		this.listFoodID = listFoodID;
	}

	public List<ServicePair> getListServiceReservation() {
		return listServiceReservation;
	}

	public void setListServiceReservation(List<ServicePair> listServiceReservation) {
		this.listServiceReservation = listServiceReservation;
	}

	public int getWeddingID() {
		return weddingID;
	}

	public void setWeddingID(int weddingID) {
		this.weddingID = weddingID;
	}

	public List<ServicePair> getListOldServiceReservation() {
		return listOldServiceReservation;
	}

	public void setListOldServiceReservation(List<ServicePair> listOldServiceReservation) {
		this.listOldServiceReservation = listOldServiceReservation;
	}

}
