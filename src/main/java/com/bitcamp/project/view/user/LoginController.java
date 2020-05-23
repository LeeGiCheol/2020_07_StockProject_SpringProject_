//package com.bitcamp.project.view.user;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.bitcamp.project.dao.impl.UserDAOImpl;
//import com.bitcamp.project.vo.UserVO;
//
//@Controller
//public class LoginController{
//	
//	/* @ModelAttribute("user")는 userVO라는 기본 이름을 
//	 * 사용하지 않고
//	 * user라는 이름으로 jsp에서 접근하도록 한다.
//	 * */
//	
//	@RequestMapping(value="/login.do", method=RequestMethod.GET)
//	public String loginView(@ModelAttribute("user") UserVO vo) {
//		System.out.println("로그인 화면으로 이동");
//		vo.setId("test");
//		vo.setPassword("test123");
//		// Command 객체를 request에 저장해준다
//		// ${user.id}
//		// ${user.password}
//		// 이렇게 login.jsp에서 사용가능하다.
//		return "login.jsp";
//	}
//	
//	@RequestMapping(value="/login.do", method=RequestMethod.POST)
//	public String login(UserVO vo, UserDAOImpl userDAO, HttpSession session) {
//		System.out.println("로그인 인증 처리...");
//		UserVO user = userDAO.getUser(vo);
//		
//		if(vo.getId()==null || vo.getId()=="") {
//			throw new IllegalArgumentException("아이디는 반드시 입력하세요");
//		}
//		if(user!=null) {
//			session.setAttribute("userName", user.getName());
//			return "getBoardList.do";
//		}
//		else
//			return "login.jsp";
//	}
//}
//
//
//
//
//
//
