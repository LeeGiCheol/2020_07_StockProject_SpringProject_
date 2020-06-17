package com.bitcamp.project.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ServiceCenterController {

	@GetMapping("serviceCenter")
	public String getServiceCenter() {
		return "customerLanding";
	}
	
}
