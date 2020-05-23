package com.bitcamp.project.service;

import java.util.Map;

import com.bitcamp.project.vo.UserVO;

public interface SignUpService {
	public void signUp(UserVO vo);
	public int duplicateCheck(Map<String, String> map);	
}
