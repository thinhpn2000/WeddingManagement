package com.wedding.models;

import java.util.List;

public class Reservation {
	private String groom;
	private String bride;
	private String phone;
	private int tableQuantity;
	private int reservedTable;
	private int lobbyID;
	private int userID;
	private int tablePrice;
	private int totalServicePrice;
	private int totalTablePrice;
	private int totalWeddingPrice;
	private String reservationDate;
	private String weddingDate;
	private int shift;
	private int deposit;
	private int balance;
	private List<Integer> listFoodID;
	private List<ServicePair> listServiceReservation;


	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGroom() {
		return groom;
	}

	public void setGroom(String groom) {
		this.groom = groom;
	}

	public String getBride() {
		return bride;
	}

	public void setBride(String bride) {
		this.bride = bride;
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

	public int getLobbyID() {
		return lobbyID;
	}

	public void setLobbyID(int lobbyID) {
		this.lobbyID = lobbyID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getTablePrice() {
		return tablePrice;
	}

	public void setTablePrice(int tablePrice) {
		this.tablePrice = tablePrice;
	}

	public int getTotalTablePrice() {
		return totalTablePrice;
	}

	public void setTotalTablePrice(int totalTablePrice) {
		this.totalTablePrice = totalTablePrice;
	}

	public int getTotalWeddingPrice() {
		return totalWeddingPrice;
	}

	public void setTotalWeddingPrice(int totalWeddingPrice) {
		this.totalWeddingPrice = totalWeddingPrice;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getWeddingDate() {
		return weddingDate;
	}

	public void setWeddingDate(String weddingDate) {
		this.weddingDate = weddingDate;
	}

	public int getShift() {
		return shift;
	}

	public void setShift(int shift) {
		this.shift = shift;
	}

	public List<Integer> getListFoodID() {
		return listFoodID;
	}

	public void setListFoodID(List<Integer> listFoodID) {
		this.listFoodID = listFoodID;
	}

	public int getTotalServicePrice() {
		return totalServicePrice;
	}

	public void setTotalServicePrice(int totalServicePrice) {
		this.totalServicePrice = totalServicePrice;
	}

	public List<ServicePair> getListServiceReservation() {
		return listServiceReservation;
	}

	public void setListServiceReservation(List<ServicePair> listServiceReservation) {
		this.listServiceReservation = listServiceReservation;
	}

}
