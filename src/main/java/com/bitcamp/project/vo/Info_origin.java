package com.bitcamp.project.vo;

import java.util.Arrays;
import java.util.List;

public class Info_origin {
	// 종목명	현재가	전일비	등락률	액면가	거래량	시가	고가	저가
	
	
	
	private String stockName; //종목명
	private String currentPrice; //현재가
	private String before; //전일비
	private String upDown; //등락률
	private String maximum; // 상한가
	private String minimum; // 하한가
	private int[] up; // 호가+
	private int[] down; // 호가-
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(String currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getBefore() {
		return before;
	}
	public void setBefore(String before) {
		this.before = before;
	}
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	public String getMaximum() {
		return maximum;
	}
	public void setMaximum(String maximum) {
		this.maximum = maximum;
	}
	public String getMinimum() {
		return minimum;
	}
	public void setMinimum(String minimum) {
		this.minimum = minimum;
	}
	public int[] getUp() {
		return up;
	}
	public void setUp(int[] up) {
		this.up = up;
	}
	public int[] getDown() {
		return down;
	}
	public void setDown(int[] down) {
		this.down = down;
	}
	@Override
	public String toString() {
		return "Info [stockName=" + stockName + ", currentPrice=" + currentPrice + ", before=" + before + ", upDown="
				+ upDown + ", maximum=" + maximum + ", minimum=" + minimum + ", up=" + Arrays.toString(up) + ", down="
				+ Arrays.toString(down) + "]";
	}
	
	
	
	
	
	
}
