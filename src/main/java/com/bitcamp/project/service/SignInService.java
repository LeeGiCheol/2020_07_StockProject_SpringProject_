package com.bitcamp.project.service;

import com.bitcamp.project.vo.UserVO;

public interface SignInService {
	public UserVO logIn(UserVO vo);
	public void logOut();
	public UserVO findId(UserVO vo);
	public void tryId();
	public UserVO findPw(UserVO vo);
	public UserVO updatePw(UserVO vo);
	public String kakao_GetToken(String code);
	public String getKakaoId(String access_Token);
	public String existenceID(String id);
}
