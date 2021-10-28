package com.to.t1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	// 홈으로 가는 컨트롤러 /으로 가면 홈으로 이동
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	
}
