package com.bitcamp.project.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitcamp.project.service.UserInfoService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class MyPageController {
	
	@Autowired
	private UserInfoService UserInfoService;
	
	@GetMapping(value="/myPage01")
	public String myPage01() {
		return "mypage01";
	}
	
	@GetMapping(value="/myPage02")
	public String myPage02() {
		return "mypage02";
	}

	@GetMapping(value="/myPage03")
	public String myPage03() {
		return "mypage03";
	}
	
	@PostMapping(value="/updateUser")
	public String updateUser(@ModelAttribute("pw") String pw, @ModelAttribute("address") String address,
							@ModelAttribute("tel") String tel, @ModelAttribute("showEsetSetting") String showEset, HttpSession session) {
		System.out.println(pw);
		System.out.println(address);
		System.out.println(tel);
		System.out.println(showEset);
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		loginUser.setPw(pw);
		loginUser.setAddress(address);
		loginUser.setTel(tel);
		loginUser.setShowEsetSetting(Integer.parseInt(showEset));
		UserInfoService.memberInfoUpdate(loginUser);
		session.setAttribute("loginUser", loginUser);
		return "mypage01";
	}
}
