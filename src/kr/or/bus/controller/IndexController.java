/*
*	@FileName : IndexController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : 메인 페이지로 넘기는 컨트롤러
*/



package kr.or.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/bus.htm")
	public String bus(){
		return "bus";
	}
	
}
