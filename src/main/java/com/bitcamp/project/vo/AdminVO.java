package com.bitcamp.project.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AdminVO {
	
	// Question
	private int qno;
	private String qtitle;
	private String qcontent;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date qdateTime;
	private String qcheck;
	private String qtype;
	
	// Answer
	private int ano;
	private String acontent;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date adateTime;
	
	//report
	private int pno;
	private String title;
	private String rtype;
	private String rcontent;
	private Date rdatetime;
	private String nickname;
	
	
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRtype() {
		return rtype;
	}
	public void setRtype(String rtype) {
		this.rtype = rtype;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRdatetime() {
		return rdatetime;
	}
	public void setRdatetime(Date rdatetime) {
		this.rdatetime = rdatetime;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
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
		return "AdminVO [qno=" + qno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qdateTime="
				+ qdateTime + ", qcheck=" + qcheck + ", qtype=" + qtype + ", ano=" + ano + ", acontent=" + acontent
				+ ", adateTime=" + adateTime + "]";
	}
	

	
	
	
}
