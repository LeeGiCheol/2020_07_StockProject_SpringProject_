package com.bitcamp.project.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserVO {
	private String id; 
	private String pw;
	private String nickname;
	private String tel;
	private int point;
	private int showEsetSetting; // 보유 자산 공개여부 // 0이면 비공개 1이면 공개
	private String address;
	private int charge; // 재지급 횟수
	private long money;
	
	private String friend;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date udateTime;
	
	

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

	public int getShowEsetSetting() {
		return showEsetSetting;
	}

	public void setShowEsetSetting(int showEsetSetting) {
		this.showEsetSetting = showEsetSetting;
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

	public String getFriend() {
		return friend;
	}

	public void setFriend(String friend) {
		this.friend = friend;
	}

	public long getMoney() {
		return money;
	}

	public void setMoney(long money) {
		this.money = money;
	}

	
	
	public Date getUdateTime() {
		return udateTime;
	}

	public void setUdateTime(Date udateTime) {
		this.udateTime = udateTime;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", nickname=" + nickname + ", tel=" + tel + ", point=" + point
				+ ", showEsetSetting=" + showEsetSetting + ", address=" + address + ", charge=" + charge + ", money="
				+ money + ", friend=" + friend + ", udateTime=" + udateTime + "]";
	}

	
	
	
	
	
}
