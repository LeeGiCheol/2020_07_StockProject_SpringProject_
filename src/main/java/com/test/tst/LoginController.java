package com.test.tst;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private SignInService signInService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "redirect:"+model.getAttribute("url");
	}
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(HttpServletRequest request, Model model, @RequestParam(value="code", required=false) String code, @RequestParam(value="state", required=false) String state, HttpSession session)
			throws IOException, ParseException {
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			
			String nickname = (String) response_obj.get("nickname");
			String id = ((String) response_obj.get("email"));
			UserVO vo = new UserVO();
			vo.setId(id+"_naver_");
			vo = signInService.logIn(vo);
			
			if (vo == null) { 
			  session.setAttribute("naverId", id+"_naver_");
			  session.setAttribute("naverNickname", nickname);
			  return "signup_naver";
			} else {
				session.setAttribute("loginUser", vo);
				model.addAttribute("result", apiResult);
				return "redirect:/mainPage";
			}
	}
}
