package com.bitcamp.project.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.UserVO;

public interface UserInfoDAO {
	public void memberInfo();
	public void memberDelete();
	public void memberInfoUpdate(UserVO vo);
	public List getNotice(String id);
	public void deleteNotice(String id);
	public void updatePassword(UserVO vo);
	public int mypageUpdatePasswordCheck(Map<String, String> map);
	public int getChargingCount(String id);
	public void consumpCharge(String id);
	public long getAccumAsset(String id);
	public int getRanking(String id);
	public List getCurrentRevenue();
	public List<Integer> getUnoList(String id);
	public void deleteUnsettledCheck(int uno);
}
