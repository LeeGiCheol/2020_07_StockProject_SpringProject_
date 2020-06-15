package com.bitcamp.project.vo;

public class HoldingStockVO {
	String id;
	String stockCode;
	String stockName;
	String quantity;
	String avgPrice;
	int currentPrice;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(String avgPrice) {
		this.avgPrice = avgPrice;
	}
	public int getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(int currentPrice) {
		this.currentPrice = currentPrice;
	}
	@Override
	public String toString() {
		return "HoldingStockVO [id=" + id + ", stockCode=" + stockCode + ", stockName=" + stockName + ", quantity="
				+ quantity + ", avgPrice=" + avgPrice + "]";
	}
}
