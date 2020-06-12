package com.bitcamp.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int cno;
	private int pno;
	private String id;
	private String nickname;
	private String ccontent;
	private Date cdateTime;
	
	
}
