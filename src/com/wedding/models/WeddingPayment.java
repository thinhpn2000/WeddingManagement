package com.wedding.models;

import java.util.List;

public class WeddingPayment {
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

	private List<Food> listFood;
	private List<ServicePrice> listServicePrice;

	private String lobbyName;
	private String shiftTypeName;
	private int minPrice;

	private int weddingID;
	private int weddingStatus;
	private int maxTable;

	public WeddingPayment() {
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

	public int getTotalServicePrice() {
		return totalServicePrice;
	}

	public void setTotalServicePrice(int totalServicePrice) {
		this.totalServicePrice = totalServicePrice;
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

	public List<Food> getListFood() {
		return listFood;
	}

	public void setListFood(List<Food> listFoodID) {
		this.listFood = listFoodID;
	}

	public List<ServicePrice> getListServicePrice() {
		return listServicePrice;
	}

	public void setListServicePrice(List<ServicePrice> listServiceReservation) {
		this.listServicePrice = listServiceReservation;
	}

	public String getLobbyName() {
		return lobbyName;
	}

	public void setLobbyName(String lobbyName) {
		this.lobbyName = lobbyName;
	}

	public String getShiftTypeName() {
		return shiftTypeName;
	}

	public void setShiftTypeName(String shiftTypeName) {
		this.shiftTypeName = shiftTypeName;
	}

	public int getWeddingID() {
		return weddingID;
	}

	public void setWeddingID(int weddingID) {
		this.weddingID = weddingID;
	}

	public int getMaxTable() {
		return maxTable;
	}

	public void setMaxTable(int maxTable) {
		this.maxTable = maxTable;
	}

	public int getWeddingStatus() {
		return weddingStatus;
	}

	public void setWeddingStatus(int weddingStatus) {
		this.weddingStatus = weddingStatus;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
}
