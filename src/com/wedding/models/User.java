package com.wedding.models;

public class User {
	private int maNV;
	private String tenNV;
	private String username;
	private String pswd;
	private String email;
	private String ngaySinh;
	private String NGVL;
	private int roleID;
	private int luong;
	private String statusNV;
	private String gioiTinh;
	private boolean isDeleted;
	
	public User() {}
	
	

	public User(int maNV, String tenNV, String username, String pswd, String email, String ngaySinh, String nGVL,
			int roleID, int luong, String statusNV, String gioiTinh, boolean isDeleted) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.username = username;
		this.pswd = pswd;
		this.email = email;
		this.ngaySinh = ngaySinh;
		NGVL = nGVL;
		this.roleID = roleID;
		this.luong = luong;
		this.statusNV = statusNV;
		this.gioiTinh = gioiTinh;
		this.isDeleted = isDeleted;
	}



	public int getMaNV() {
		return maNV;
	}

	public void setMaNV(int maNV) {
		this.maNV = maNV;
	}

	public String getTenNV() {
		return tenNV;
	}

	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getNGVL() {
		return NGVL;
	}

	public void setNGVL(String nGVL) {
		NGVL = nGVL;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public int getLuong() {
		return luong;
	}

	public void setLuong(int luong) {
		this.luong = luong;
	}

	public String getStatusNV() {
		return statusNV;
	}

	public void setStatusNV(String statusNV) {
		this.statusNV = statusNV;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	};
	
}
