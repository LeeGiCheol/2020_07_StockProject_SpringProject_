package com.bitcamp.project.vo;

public class UserVO {
	private String id; 
	private String pw;
	private String nickname;
	private String tel;
	private int point;
	private long showEset; // 보유 자산
	private String address;
	private int charge; // 재지급 횟수
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public long getShowEset() {
		return showEset;
	}
	public void setShowEset(long showEset) {
		this.showEset = showEset;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	
	
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", nickname=" + nickname + ", tel=" + tel + ", point="
				+ point + ", showEset=" + showEset + ", address=" + address + ", charge=" + charge + "]";
	}
	
	
	
	
	
	
	
}
