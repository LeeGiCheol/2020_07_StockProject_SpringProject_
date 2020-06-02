package com.bitcamp.project.vo;

import java.sql.Date;

public class CommentVO {
	private int cno;
	private int pno;
	private String id;
	private String nickname;
	private String ccontent;
	private Date cdateTime;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCdataTime() {
		return cdateTime;
	}
	public void setCdataTime(Date cdataTime) {
		this.cdateTime = cdataTime;
	}
	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", pno=" + pno + ", id=" + id + ", nickname=" + nickname + ", ccontent="
				+ ccontent + ", cdateTime=" + cdateTime + "]";
	}

	
}
