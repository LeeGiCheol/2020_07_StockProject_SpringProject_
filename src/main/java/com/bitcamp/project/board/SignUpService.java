package com.bitcamp.project.board;

import com.bitcamp.project.vo.UserVO;

public interface SignUpService {
	public void signUp(UserVO vo);
	public int duplicateCheck(String id);	
}
