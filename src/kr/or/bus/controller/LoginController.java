/*
*	@FileName : LoginController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.16
*	@Author	: 박문수
*	@Discription : 로그인 페이지 Controller
*/

package kr.or.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.bus.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@RequestMapping("/login.htm")
	public String login(){
		return "login/login";
	}
	
	@RequestMapping("/main.htm")
	public String mainGo(){
		return "main/main";
	}
	
	@RequestMapping("/search.htm")
	public String search(){
		return "login/search";
	}
	
	@RequestMapping("/searchid.htm")
	public String searchId(String m_name , String m_email) throws Exception{
		String viewpage = "";
		
		if(service.searchName(m_name, m_email).equals("")){
			viewpage = "login/searchidfail";
		}else{
			viewpage = "login/searchidsuccess";
		}
		
		return viewpage;
	}
	
	@RequestMapping("/searchpw.htm")
	public String searchPw(String m_id , String m_email) throws Exception{
		String viewpage = "";
		
		if(service.searchPw(m_id, m_email).equals("")){
			viewpage = "login/searchidfail";
		}else{
			viewpage = "login/searchpwsuccess";
		}
		
		return viewpage;
	}
}
