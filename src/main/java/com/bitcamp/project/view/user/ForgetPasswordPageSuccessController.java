package com.bitcamp.project.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForgetPasswordPageSuccessController {
	
	@GetMapping("/forgetidsuccess")
	public String newsBoard() {
		return "forgetidpagesuccess";
	}
}
