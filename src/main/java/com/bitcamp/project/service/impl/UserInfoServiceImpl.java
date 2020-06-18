package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.UserInfoDAO;
import com.bitcamp.project.service.UserInfoService;
import com.bitcamp.project.vo.UserVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO userInfoDAO;
	
	
	
	@Override
	public List getCurrentRevenue() {
		return userInfoDAO.getCurrentRevenue();
	}

	@Override
	public void deleteNotice(String id) {
		userInfoDAO.deleteNotice(id);
	}

	@Override
	public List getNotice(String id) {
		return userInfoDAO.getNotice(id);
	}

	@Override
	public void memberInfo() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberDelete() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberInfoUpdate(UserVO vo) {
		userInfoDAO.memberInfoUpdate(vo);
	}

	@Override
	public void updatePassword(UserVO vo) {
		userInfoDAO.updatePassword(vo);
	}

	@Override
	public int mypageUpdatePasswordCheck(Map<String, String> map) {
		return userInfoDAO.mypageUpdatePasswordCheck(map);
	}
	
	public int checkCharging(String id) {
		int chargeCount = userInfoDAO.getChargingCount(id);
		if(chargeCount > 0) {
			List<Integer> uList = userInfoDAO.getUnoList(id);
			for (int i = 0; i < uList.size(); i++) {
				userInfoDAO.deleteUnsettledCheck(uList.get(i));
			}
			userInfoDAO.consumpCharge(id);
		}
		return chargeCount;
	}

	@Override
	public HashMap<String, Object> getRate(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accumAsset", userInfoDAO.getAccumAsset(id));
		map.put("ranking", userInfoDAO.getRanking(id));
		return map;
	}
	
	

}
