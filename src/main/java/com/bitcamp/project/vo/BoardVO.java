package com.bitcamp.project.vo;

/*
	xml로 변환하려면 기본 생성자가 있어야 하는데
	java.sql.Date는 기본 생성자가 없다
	그러므로 기본 생성자가 있는 java.util.Date로 변경하였다
 */

//import java.sql.Date;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BoardVO {
	private int pno; // 글번호
	private String nickname; // 별명
	private String title; // 제목
	private String content; // 내용
	private int views; // 조회수
	private int likes; // 조아용
	private Date bdateTime; // 작성일
	private int bno; // 게시판번호(종류)
	private MultipartFile uploadFile;
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", nickname=" + nickname + ", title=" + title + ", content=" + content
				+ ", views=" + views + ", likes=" + likes + ", bdateTime=" + bdateTime + ", bno=" + bno
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	
	
	
	
	
	
	
}
