/*
*	@FileName : LoginController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.16
*	@Author	: 박문수
*	@Discription : 로그인 페이지 Controller
*/

package kr.or.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login.htm")
	public String login(){
		System.out.println("오냐");
		return "login/login";
	}
	
	@RequestMapping("/main.htm")
	public String mainGo(){
		return "main/main";
	}
}
