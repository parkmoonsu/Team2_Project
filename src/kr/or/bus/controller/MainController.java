package kr.or.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.bus.service.JoinService;
import kr.or.bus.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	
@RequestMapping("/InfoChange.htm")
public String login(){
		return "main/InfoChange";
	}
	
/*@RequestMapping("/InfoChange.htm")
public String select(Model model){
		
	service.selectall();
	
	
		return "main/InfoChange";
	}*/
	

}
