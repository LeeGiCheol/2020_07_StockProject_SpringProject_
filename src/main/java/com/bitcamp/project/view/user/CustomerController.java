package com.bitcamp.project.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
	
	@GetMapping(value="/customer")
	public String customerLanding() {
		return "customerLanding";
	}
}
