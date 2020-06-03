package com.bitcamp.project.view.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.service.SignUpService;
import com.bitcamp.project.vo.UserVO;

@Controller
public class SignUpController {
	

	@Autowired
	private SignUpService signUpService;
	
	// 회원가입화면
		@GetMapping(value="/signUpPage/1")
		public String signUpVieww() {
				return "signup01";
		}
////		// 회원가입화면
//		@PostMapping(value="/signUp2")
//		public String signUpViewww(@RequestParam("agree") String agree) {
//			if(agree.equals("Y"))
//				return "signup02";
//			else
//				return "signup01";
//		}
	
	
//	// 회원가입화면
	@GetMapping(value="/signUpPage/2")
	public String signUpView(UserVO vo) {
		System.out.println("vo suv : " + vo.toString());
		return "signup02";
	}

	// 회원가입완료화면
	@PostMapping(value="/signUp")
	public String signUp(UserVO vo, @RequestParam("friend") String friend) {
		if(friend != null) {
			vo.setFriend(friend);
		}
		
		System.out.println("vo su : " + vo.toString());
		
		signUpService.signUp(vo);
		
		
		return "signup03";
	}
	
	

	@ResponseBody 
	@GetMapping(value= {"/idCheck", "/nickCheck", "/friendCheck"})
	public String duplicateCheck(@ModelAttribute("id") String id, 
								@ModelAttribute("nickname") String nickname, HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		// 아이디 중복확인
		if(request.getServletPath().equals("/idCheck")) {
			map.put("id", id);
			
			
			int result=signUpService.duplicateCheck(map);
			System.out.println("id"+result);
			return Integer.toString(result);
		}
		
		// 닉네임 중복확인
		else if(request.getServletPath().equals("/nickCheck")) {
			map.put("nickname", nickname);
			
			
			int result=signUpService.duplicateCheck(map);
			System.out.println("nick"+result);
			return Integer.toString(result);
		}
		
		// 추천인 중복확인
		else if(request.getServletPath().equals("/friendCheck")) {
			System.out.println("firend "+nickname);
			map.put("nickname", nickname);
			
			int result=signUpService.duplicateCheck(map);
			System.out.println("friend2 "+result);
			return Integer.toString(result);
		}
		return null;
	}
	
	

	@RequestMapping("/signUpPage/jusoPopup")
    public String jusoPopup() {
		return "address/jusoPopup";
    }


	
	
}
