package com.bitcamp.project.vo;

/*
	xml로 변환하려면 기본 생성자가 있어야 하는데
	java.sql.Date는 기본 생성자가 없다
	그러므로 기본 생성자가 있는 java.util.Date로 변경하였다
 */

//import java.sql.Date;
import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int pno; // 글번호
	private String id;
	private String nickname; // 별명
	private String title; // 제목
	private String bcontent; // 내용
	private int views; // 조회수
	private int likes; // 조아용
	private Date bdateTime; // 작성일
	private int bno; // 게시판번호(종류)
	private int commentCount;
	
	

	

	
	
	
}