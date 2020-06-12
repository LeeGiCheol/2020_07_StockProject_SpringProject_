package com.bitcamp.project.vo;

import lombok.Data;

public class holdingStockVO {
	String stockCode;
	String stockName;
	String quantity;
	String avgPrice;
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
	@Override
	public String toString() {
		return "holdingStockVO [stockCode=" + stockCode + ", stockName=" + stockName + ", quantity=" + quantity
				+ ", avgPrice=" + avgPrice + "]";
	}
	
	
	
}
