package com.bitcamp.project.vo;

import lombok.Data;

@Data
public class UserVO {
	private String id; 
	private String pw;
	private String nickname;
	private String tel;
	private int point;
	private int showEsetSetting; // 보유 자산 공개여부 // 0이면 비공개 1이면 공개
	private String address;
	private int charge; // 재지급 횟수
	
	private String friend;
	
}
