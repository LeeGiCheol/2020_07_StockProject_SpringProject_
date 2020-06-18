package com.bitcamp.project.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
	
	@GetMapping(value="/customer")
	public String customerLanding() {
		return "customerLanding";
	}
	
	@GetMapping(value="/customerNotice")
	public String customerNotice() {
		return "customerNotice";
	}	
	
	@GetMapping(value="/customerNoticeDetail")
	public String customerNoticeDetail() {
		return "customerNoticeDetail";
	}	
	
	@GetMapping(value="/customerqna")
	public String customerqna() {
		return "customerqna";
	}	
	
	@GetMapping(value="/customNoticeWrite")
	public String customNoticeWrite() {
		return "customNoticeWrite";
	}	
	
	@GetMapping(value="/customClaimWrite")
	public String customClaimWrite() {
		return "customClaimWrite";
	}
	
}
