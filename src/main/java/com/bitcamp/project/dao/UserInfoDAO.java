package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface UserInfoDAO {
	public void memberInfo();
	public void memberDelete();
	public void memberInfoUpdate(UserVO vo);
}
