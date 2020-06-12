package com.bitcamp.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StockVO {
	private int tno;
	private int uno;
	private int rPrice;
	private int quantity;
	private int tprice;
	private int avgprice;
	private int newPrice;
	private int newQuantity;
	private String stockCode;
	private String stockName;
	private String id;
	private String category;
	private Date tdatetime;
	private int buysell;
	private boolean modifyALL;
	
}
