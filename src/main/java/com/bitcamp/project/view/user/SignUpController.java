package com.bitcamp.project.view.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.service.SignUpService;
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
	@RequestMapping(value= {"/idCheck", "/nickCheck", "/friendCheck"}, method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String duplicateCheck(@ModelAttribute("id") String id, @ModelAttribute("nickname") String nickname, HttpServletRequest request) {
		if(request.getServletPath().equals("/idCheck")) {
			System.out.println(id);
	
			int result=signUpService.duplicateCheck(id);
			System.out.println("id"+result);
			return Integer.toString(result);
		}
		
		else if(request.getServletPath().equals("/nickCheck")) {
			System.out.println(nickname);
	
			int result=signUpService.duplicateCheck(nickname);
			System.out.println("nick"+result);
			return Integer.toString(result);
		}
		
		else if(request.getServletPath().equals("/friendCheck")) {
			System.out.println(id);
			
			int result=signUpService.duplicateCheck(id);
			System.out.println("nick"+result);
			return Integer.toString(result);
		}
		
		return null;
	}
	
}
