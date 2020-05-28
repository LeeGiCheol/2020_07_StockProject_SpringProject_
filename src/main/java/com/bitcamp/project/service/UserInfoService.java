package com.bitcamp.project.service;

import com.bitcamp.project.vo.UserVO;

public interface UserInfoService {
	public void memberInfo();
	public void memberDelete();
	public void memberInfoUpdate(UserVO vo);
}
