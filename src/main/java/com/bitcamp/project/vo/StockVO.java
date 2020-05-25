package com.bitcamp.project.vo;

import java.util.Date;

public class StockVO {
	private int tno;
	private int quantity;
	private int tprice;
	private int stockCode;
	private String stockName;
	private String id;
	private String tcategory;
	private Date tdatetime;
	
	public int getStockCode() {
		return stockCode;
	}
	public void setStockCode(int stockCode) {
		this.stockCode = stockCode;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTprice() {
		return tprice;
	}
	public void setTprice(int tprice) {
		this.tprice = tprice;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTcategory() {
		return tcategory;
	}
	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}
	public Date getTdatetime() {
		return tdatetime;
	}
	public void setTdatetime(Date tdatetime) {
		this.tdatetime = tdatetime;
	}
	
}
