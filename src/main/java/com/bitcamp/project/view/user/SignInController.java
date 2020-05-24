package com.bitcamp.project.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitcamp.project.service.SignUpService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class SignInController {
	
	@Autowired
	private SignUpService signUpService;
	
	@GetMapping(value="/signInPage" )
	public String signUpView(UserVO vo) {
		return "login";
	}
}
