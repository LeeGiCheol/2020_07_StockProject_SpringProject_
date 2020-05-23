package com.bitcamp.project.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.board.SignUpService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class SignUpController {
	@Autowired
	private SignUpService signUpService;
	
	// 회원가입화면
	@RequestMapping(value="/signUpPage", method=RequestMethod.GET)
	public String signUpView(UserVO vo) {
		return "signup02";
	}

	// 회원가입완료화면
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(UserVO vo) {
		signUpService.signUp(vo);
		return "signup03";
	}
	
	
	// 아이디 중복확인
	@ResponseBody 
	@RequestMapping(value="/idCheck", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("로그인 첵크");
	
		System.out.println(id);
		int result=signUpService.duplicateCheck(id);
		
		 
		return Integer.toString(result);
	}
	
}
