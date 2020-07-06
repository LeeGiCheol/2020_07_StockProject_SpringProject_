package com.bitcamp.project.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentVO {
	private int cno;
	private int pno;
	private String id;
	private String nickname;
	private String ccontent;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
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
	public Date getCdateTime() {
		return cdateTime;
	}
	public void setCdateTime(Date cdateTime) {
		this.cdateTime = cdateTime;
	}
	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", pno=" + pno + ", id=" + id + ", nickname=" + nickname + ", ccontent="
				+ ccontent + ", cdateTime=" + cdateTime + "]";
	}
	
	
}
