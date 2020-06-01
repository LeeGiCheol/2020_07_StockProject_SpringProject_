package com.bitcamp.project.vo;

import java.sql.Date;

public class StockVO {
	private int tno;
	private int uno;
	private int rPrice;
	private int quantity;
	private int tprice;
	private int newPrice;
	private int newQuantity;
	private String stockCode;
	private String stockName;
	private String id;
	private String category;
	private Date tdatetime;
	private int buysell;
	private boolean modifyALL;
	
	
	
	
	
	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
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

	public int getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(int newPrice) {
		this.newPrice = newPrice;
	}

	public int getNewQuantity() {
		return newQuantity;
	}





	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
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





	public String getId() {
		return id;
	}





	public void setId(String id) {
		this.id = id;
	}





	public String getCategory() {
		return category;
	}





	public void setCategory(String category) {
		this.category = category;
	}





	public Date getTdatetime() {
		return tdatetime;
	}





	public void setTdatetime(Date tdatetime) {
		this.tdatetime = tdatetime;
	}





	public int getBuysell() {
		return buysell;
	}





	public void setBuysell(int buysell) {
		this.buysell = buysell;
	}





	public boolean isModifyALL() {
		return modifyALL;
	}





	public void setModifyALL(boolean modifyALL) {
		this.modifyALL = modifyALL;
	}





	@Override
	public String toString() {
		return "StockVO [tno=" + tno + ", uno=" + uno + ", rPrice=" + rPrice + ", quantity=" + quantity + ", tprice="
				+ tprice + ", stockCode=" + stockCode + ", stockName=" + stockName + ", id=" + id + ", tcategory="
				+ category + ", tdatetime=" + tdatetime + "]";
	}
	
}
