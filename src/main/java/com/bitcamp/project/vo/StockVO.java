package com.bitcamp.project.vo;

import java.sql.Date;

public class StockVO {
	private int tno;
	private int uno;
	private int rPrice;
	private int quantity;
	private int tprice;
	private String stockCode;
	private String stockName;
	private String id;
	private String category;
	private Date tdatetime;
	private int buysell;
	private boolean modifyALL;
	
	
	public boolean isModifyALL() {
		return modifyALL;
	}
	public void setModifyALL(boolean modifyALL) {
		this.modifyALL = modifyALL;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getBuysell() {
		return buysell;
	}
	public void setBuysell(int buysell) {
		this.buysell = buysell;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
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

	public Date getTdatetime() {
		return tdatetime;
	}
	public void setTdatetime(Date tdatetime) {
		this.tdatetime = tdatetime;
	}
	@Override
	public String toString() {
		return "StockVO [tno=" + tno + ", uno=" + uno + ", rPrice=" + rPrice + ", quantity=" + quantity + ", tprice="
				+ tprice + ", stockCode=" + stockCode + ", stockName=" + stockName + ", id=" + id + ", tcategory="
				+ category + ", tdatetime=" + tdatetime + "]";
	}
	
}
