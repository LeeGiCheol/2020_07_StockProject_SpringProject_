package com.bitcamp.project.view.user;

import static com.bitcamp.project.view.user.ExampleSend.numStr;
import static com.bitcamp.project.view.user.MailController.EmailNumStr;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import edu.emory.mathcs.backport.java.util.Arrays;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
	@Autowired
    PasswordEncoder passwordEncoder;	
	@Autowired
	BCryptPasswordEncoder bPasswordEncoder;
	
	@GetMapping(value="/signInPage" )
	public String signInView(UserVO vo) {
		return "login";
	}
	
	@PostMapping(value="/signIn")
	public ModelAndView signIn(@ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserVO vo = new UserVO();
		vo.setId(id);
		vo = signInService.logIn(vo);
			String dbPw = vo.getPw(); // db에 저장된 pw
            String inputPw = pw;	// 사용자가 입력한 pw
            System.out.println("1 "+dbPw);
            System.out.println("2 " +inputPw);
            if(vo != null) {
	            if(bPasswordEncoder.matches(pw, dbPw)) {
	            	System.out.println("비밀번호가 일치함");
	                vo.setPw(dbPw);
	                session.setAttribute("loginUser", vo);
					mav.addObject("msg", "로그인 성공!");
					mav.addObject("location", "/mainPage");
					mav.setViewName("notice");
					return mav;
	            }else {
	            	System.out.println("비밀번호가 ㄴㄴ");
	            	mav.addObject("msg", "로그인 실패!");
					mav.addObject("location", "/signInPage");
					mav.setViewName("notice");
					return mav;
	            }
            }
			else {
				mav.addObject("msg", "로그인 실패!");
				mav.addObject("location", "/signInPage");
				mav.setViewName("notice");
				return mav;
			}
	}
	
	@GetMapping(value="/logOut")
	public String logout(HttpSession session) {
		if(((UserVO)session.getAttribute("loginUser")).getId().substring(((UserVO)session.getAttribute("loginUser")).getId().length()-1).equals("_")) { //끝글자 확인
			String ID = ((UserVO)session.getAttribute("loginUser")).getId();
			String[] ID_s = ID.split("_");
			
			switch (ID_s[ID_s.length-1]) {
			case "kakao":
				System.out.println("카카오 로그아웃");
				session.invalidate();
				return "redirect:Https://kauth.kakao.com/oauth/logout?client_id=68ded79fcd9705764c35c87e4e593e4c&logout_redirect_uri=http://106.240.16.163:8080/mainPage";
				
			case "naver":
				System.out.println("네이버 로그아웃");
				break;
				
			case "google":
				System.out.println("구글 로그아웃");
				break;
				
			default:
				break;
			}
			
		}
		session.invalidate();
		return "redirect:/mainPage";
	}
	
	@GetMapping(value="/forgetId")
	public String findIdView() {
		System.out.println("로그");
		return "forgetidpage";
	}
	
	@GetMapping(value="/forgetIdTry") //문자 전송이 완료했으면.
	public String tryIdView(@ModelAttribute("answer") String answer) {
			return "forgetidpage-try-success"; // 인증화면
	}
	
	@SuppressWarnings("unused")
	@PostMapping(value= {"/forgetId", "/forgetIdTry"})
	public String findId(Model model, String[] args, UserVO vo, @ModelAttribute("tel") String tel, @ModelAttribute("answer") String answer, HttpSession session, HttpServletRequest request) {
			
		if(request.getServletPath().equals("/forgetId")) {
			vo.setTel(tel);
			vo = signInService.findId(vo);
			session.setAttribute("findUser", vo);
			System.out.println("@@@@ : " + vo);
			if(vo==null || vo.getTel().equals("") ) { // 없는 전화번호
				return "/forgetidpagefail"; // 데이터베이스에 없는 값 입력시 페이지
			}else if(vo.getId().contains("_naver_"))  {
				model.addAttribute("msg", "회원님은 네이버회원이십니다. 네이버로 이동합니다");
				model.addAttribute("icon", "success");
				model.addAttribute("location", "https://nid.naver.com/user2/help/idInquiry.nhn?menu=idinquiry");
				return "/msg";	
			}else if(vo.getId().contains("_kakao")){
				model.addAttribute("msg", "회원님은 카카오톡회원이십니다. 네이버로 이동합니다");
				model.addAttribute("icon", "success");
				model.addAttribute("location", "https://accounts.kakao.com/weblogin/find_account?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount#pageFindAccountSelect");
				return "/msg";	
			}else { //있는 전화번호라면?
				ExampleSend es = new ExampleSend(); // 문자보내는 클래스 
				ExampleSend.main(args, tel);  // 문자보내는 메서드
				return "/forgetidpage-try-success";
			}
		}
		
		else if(request.getServletPath().equals("/forgetIdTry")) {
			if(answer.equals(numStr)) { // 대답과 인증번호가 같다면
				return "/forgetidpagesuccess";
			}else {
				model.addAttribute("msg", "인증번호가 일치하지않습니다.");
				model.addAttribute("icon", "error");
				model.addAttribute("location", "/forgetIdTry");
				return "/msg";
			} 
		}
		return null;
	}
	
	@GetMapping(value="/forgetPassword")
	public String findPwView() {
		return "forgetpasswordpage";
	}
	
	@GetMapping(value="/forgetPasswordTry")
	public String findPw() {
		return "forgetpasswordpage-try-success";
	}

	@PostMapping(value= {"/forgetPassword", "forgetPasswordTry"})
	public String findPw(Model model, UserVO vo, @ModelAttribute("id") String id, @ModelAttribute("email_answer") String email_answer, 
			HttpSession session, HttpServletRequest request) throws MailException, UnsupportedEncodingException, MessagingException {
		if(request.getServletPath().equals("/forgetPassword")) {
			vo.setId(id);
			vo = signInService.findPw(vo);
			session.setAttribute("findUser", vo);
			System.out.println("@@@@: " + vo);
			if(vo==null || vo.getId().equals("") ) {
				return "/forgetpasswordpagefail";
			}else {
				return "redirect:/user/mail";
				
			}
		}
		if(request.getServletPath().equals("/forgetPasswordTry")) {
			if(email_answer.equals(EmailNumStr)) { // 대답과 인증번호가 같다면
				return "/forgetpasswordpagereset"; 
			}else {
				model.addAttribute("msg", "인증번호가 일치하지않습니다.");
				model.addAttribute("icon", "error");
				model.addAttribute("location", "/forgetPasswordTry");
				return "/msg"; // 대답과 인증번호가 다르면
			} 
		}
		return null;
	}
	
	@GetMapping(value="/updatePassword")
	public String updatePasswordView() {
		return "forgetpasswordpagereset";
	}
	
	@PostMapping(value="/updatePassword")	
	public String updatePassword(UserVO vo, @ModelAttribute("password") String password, 
			@ModelAttribute("passwordAgain") String passwordAgain, HttpSession session) {
		
		String encPassword = passwordEncoder.encode(password);
		
		if(bPasswordEncoder.matches(passwordAgain, encPassword)) {
			UserVO finduserVO = (UserVO) session.getAttribute("findUser");
			finduserVO.setPw(encPassword);
			vo = signInService.updatePw(finduserVO);
			return "/forgetpasswordpagesuccess";
		}else{ // 비밀번호랑 비밀번호 확인이 같지않으면 어처피 클릭이 되지 않아 else는 구현 안함
			
		}
	return "forgetpasswordpagereset";
	}
}