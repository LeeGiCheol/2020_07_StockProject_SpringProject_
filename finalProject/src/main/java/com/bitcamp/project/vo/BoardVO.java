package com.bitcamp.project.vo;


import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;


public class BoardVO {
	private int pno; // 글번호
	private String id;
	private String nickname; // 별명
	private String title; // 제목
	private String bcontent; // 내용
	private int views; // 조회수
	private int likes; // 조아용
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date bdateTime; // 작성일
	
	private String bno; // 게시판번호(종류)
	private int commentCount;
	
	private String rtype;
	private String rcontent;
	private String rdateTime;
	
	
	private String thumbnailName;

	
	private String chartDate;
	private String chartCount;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Date getBdateTime() {
		return bdateTime;
	}
	public void setBdateTime(Date bdateTime) {
		this.bdateTime = bdateTime;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
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
	public String getRdateTime() {
		return rdateTime;
	}
	public void setRdateTime(String rdateTime) {
		this.rdateTime = rdateTime;
	}
	public String getThumbnailName() {
		return thumbnailName;
	}
	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}
	public String getChartDate() {
		return chartDate;
	}
	public void setChartDate(String chartDate) {
		this.chartDate = chartDate;
	}
	public String getChartCount() {
		return chartCount;
	}
	public void setChartCount(String chartCount) {
		this.chartCount = chartCount;
	}
	
	
	
}