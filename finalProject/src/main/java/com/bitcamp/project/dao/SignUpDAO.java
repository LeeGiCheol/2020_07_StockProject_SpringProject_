package com.bitcamp.project.dao;

import java.util.Map;

import com.bitcamp.project.vo.UserVO;

public interface SignUpDAO {
	public void signUp(UserVO vo);
	public int duplicateCheck(Map<String, String> map);
}	