package com.bitcamp.project.vo;

import java.sql.Date;

public class CommentVO {
	private int cno;
	private int pno;
	private String id;
	private String ccontent;
	private Date cdataTime;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCdataTime() {
		return cdataTime;
	}
	public void setCdataTime(Date cdataTime) {
		this.cdataTime = cdataTime;
	}
	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", pno=" + pno + ", id=" + id + ", ccontent="
				+ ccontent + ", cdataTime=" + cdataTime + "]";
	}
	
}
