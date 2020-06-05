package com.bitcamp.project.view.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;
import static com.bitcamp.project.view.user.ExampleSend.numStr;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
	
	@GetMapping(value="/signInPage" )
	public String signInView(UserVO vo) {
		return "login";
	}
	
	@PostMapping(value="/signIn")
	public String signIn(@ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		UserVO vo = new UserVO();
		vo.setId(id);
		vo = signInService.logIn(vo);
//		if(vo != null)
//			System.out.println(vo.toString());
//		else
//			System.out.println(vo);
		if(vo != null) {
//			System.out.println("pw1 " + vo.getPw());
//			System.out.println("pw2 " + pw);
			if(vo.getPw().equals(pw)) {
				session.setAttribute("loginUser", vo);
				return "mainpage";
			}
			else return "login";
		}
		else 
			return "login";
	}
	
	@GetMapping(value="/logOut")
	public String logout(HttpSession session) {
		session.invalidate();
		return "mainpage";
	}
	
	@GetMapping(value="/forGetId")
	public String findIdView() {
		return "forgetidpage";
	}
	
	@SuppressWarnings("unused")
	@PostMapping(value="/forGetId")
	public String findId(String[] args, UserVO vo, @ModelAttribute("tel") String tel, HttpSession session) {
		vo.setTel(tel);
		vo = signInService.findId(vo);
		System.out.println("아이디 찾기한 회원의 정보 : " + vo);
		if(vo==null) {
			System.out.println("없는회원");
			return "/forgetidpagefail"; // 데이터베이스에 없는 값 입력시 페이지
		}else {
			ExampleSend es = new ExampleSend(); // 문자보내는 클래스 
			ExampleSend.main(args, tel);  // 문자보내는 메서드
			return "/forgetidpage-try-success"; //인증화면으로 보내기
		}
	}
	
	
	@GetMapping(value="/forGetIdTry") //문자 전송이 완료했으면.
	public String tryIdView(@ModelAttribute("answer") String answer) {
			return "/forgetidpage-try-success"; // 인증화면
	}
	
	
	@PostMapping(value="/forGetIdTry") //문자 전송이 완료했으면.
	public String tryId(@ModelAttribute("answer") String answer) {
		if(answer.equals(numStr)) { // 대답과 인증번호가 같다면
			return null;
		}else {
			return "/forgetidpage-try-fail"; // alert창 띄우고 다시 인증화면으로
		}
	}
	
	@GetMapping(value="/forGetPassword")
	public String findPwView() {
		return "forgetpasswordpage";
		
	}
	@PostMapping(value="/forGetPassword")
	public String findPw(UserVO vo, @ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		vo.setId(id);
		vo.setPw(pw);
		vo = signInService.findPw(vo);
		if(vo==null) {
			System.out.println("인증번호 틀림");
		}
		else {
			System.out.println("너의 새 비밀번호는 ?????니다.");
		}
		return null;
	}
}