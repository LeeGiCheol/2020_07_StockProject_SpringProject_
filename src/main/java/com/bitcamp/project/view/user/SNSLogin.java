package com.bitcamp.project.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class SNSLogin {

	@Autowired
	private SignInService signInService;

	@GetMapping(value = "/kakao")
	public String signInView(@RequestParam("code") String code, HttpSession session) {
		System.out.println("code : " + code);
		String access_Token = signInService.kakao_GetToken(code);
		System.out.println("controller access_token : " + access_Token);
		
		String userId = signInService.getKakaoId(access_Token);
		System.out.println("KaKaoID : " + userId); //이후 DB에서 ID 확인후 , 있으면 로그인 진행 , 없으면 추가정보 입력 회원가입 진행 
		
		if(signInService.existenceID(userId)==null)//추가정보 입력 필요
			
			return "signup02_kakao";
		else {
			UserVO vo = new UserVO();
			vo.setId(userId);
			session.setAttribute("loginUser", vo);
			return "mainpage";
		}
	}
}