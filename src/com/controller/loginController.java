package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.member;

@Controller
public class loginController {
	
	@RequestMapping(value="/login.do")
	public void checkIdPw(member m){
		System.out.println("/login.do 시작");
		System.out.println(m.getUsername());
	}
}
