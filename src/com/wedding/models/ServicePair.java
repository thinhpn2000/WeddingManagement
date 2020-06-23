package com.wedding.models;

public class ServicePair {
	private int serviceID;
	private int serviceQuantity;

	public int getServiceID() {
		return serviceID;
	}

	public ServicePair() {
		super();
	}

	public ServicePair(int serviceID, int serviceQuantity) {
		super();
		this.serviceID = serviceID;
		this.serviceQuantity = serviceQuantity;
	}

	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}

	public int getServiceQuantity() {
		return serviceQuantity;
	}

	public void setServiceQuantity(int serviceQuantity) {
		this.serviceQuantity = serviceQuantity;
	}
}
