package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface SignUpDAO {
	public void signUp(UserVO vo);
	public int duplicateCheck(String userInfoS);
}	