package com.bitcamp.project.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForgetIdPageController {
	
	@GetMapping("/forgetid")
	public String newsBoard() {
		return "forgetidpage";
	}
}
