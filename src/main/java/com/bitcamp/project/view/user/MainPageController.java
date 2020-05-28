package com.bitcamp.project.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {

	@GetMapping(value="/mainPage")
	public String mainPage() {
		return "mainpage";
	}
}
