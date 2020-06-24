package com.bitcamp.project.vo;

import java.util.Date;

public class AdminVO {
	
	// Question
	private int qno;
	private String id;
	private String qtitle;
	private String qcontent;
	private Date qdateTime;
	private String qcheck;
	private String qtype;
	
	// Answer
	private int ano;
	private String acontent;
	private Date adateTime;
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQdateTime() {
		return qdateTime;
	}
	public void setQdateTime(Date qdateTime) {
		this.qdateTime = qdateTime;
	}
	public String getQcheck() {
		return qcheck;
	}
	public void setQcheck(String qcheck) {
		this.qcheck = qcheck;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Date getAdateTime() {
		return adateTime;
	}
	public void setAdateTime(Date adateTime) {
		this.adateTime = adateTime;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	
	
	@Override
	public String toString() {
		return "AdminVO [qno=" + qno + ", id=" + id + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qdateTime="
				+ qdateTime + ", qcheck=" + qcheck + ", qtype=" + qtype + ", ano=" + ano + ", acontent=" + acontent
				+ ", adateTime=" + adateTime + "]";
	}
	

	
	
	
}
