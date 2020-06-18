package com.bitcamp.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.UserVO;

public interface UserInfoService {
	public void memberInfo();
	public void memberDelete();
	public void memberInfoUpdate(UserVO vo);
	public List getNotice(String id);
	public void deleteNotice(String id);
	public void updatePassword(UserVO vo);
	public int mypageUpdatePasswordCheck(Map<String, String> map);
	public int checkCharging(String id);
	public HashMap<String, Object> getRate(String id);
	public List getCurrentRevenue();
}
